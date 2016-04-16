//
//  Seguridad.m
//  SanEstebanCentenarioIdq
//
//  Created by Elias Manriquez Pro on 30-03-16.
//  Copyright © 2016 Osiris Tecnology Ltda. All rights reserved.
//

#import "Seguridad.h"
#import "NSData+Base64.h"
#import <CommonCrypto/CommonDigest.h>



@implementation Seguridad


+ (NSString *) encriptarTexto:(NSString*)texto :(NSString*)token :(NSString*)key_paso{
   
    NSDate *now = [NSDate date];
    NSString *strDate = [[NSString alloc] initWithFormat:@"%@",now];
    NSArray *arr = [strDate componentsSeparatedByString:@" "];
    NSString *str; str = [arr objectAtIndex:0];
    NSString* secret_key = key_paso;
    NSString* secret_iv = [NSString stringWithFormat:@"%@-%@",str,token];
    NSString* texto_encriptar = texto;
    NSString *key = [[self sha256:secret_key] substringToIndex:32];
    NSString *ivs = [[self sha256:secret_iv] substringToIndex:16];
    NSData* data_text = [texto_encriptar dataUsingEncoding:NSUTF8StringEncoding];
    NSData* key_data = [key dataUsingEncoding:NSUTF8StringEncoding];
    NSData* iv_data = [ivs dataUsingEncoding:NSUTF8StringEncoding];
    NSData* encryptedData = [FBEncryptorAES encryptData:data_text key:key_data iv:iv_data];
    NSString* bin = [self base64forData:encryptedData];
    NSString *clavedia =[self base64forData:[bin dataUsingEncoding:NSUTF8StringEncoding]];
    return clavedia;
}

+(NSString*)base64forData:(NSData*)theData {
    const uint8_t* input = (const uint8_t*)[theData bytes];
    NSInteger length = [theData length];
    
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
    
    NSInteger i;
    for (i=0; i < length; i += 3) {
        NSInteger value = 0;
        NSInteger j;
        for (j = i; j < (i + 3); j++) {
            value <<= 8;
            
            if (j < length) {  value |= (0xFF & input[j]);  }  }  NSInteger theIndex = (i / 3) * 4;  output[theIndex + 0] = table[(value >> 18) & 0x3F];
        output[theIndex + 1] = table[(value >> 12) & 0x3F];
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6) & 0x3F] : '=';
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0) & 0x3F] : '=';
    }
    
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    
}


+(NSString*) sha256:(NSString *)clear{
    const char *s=[clear cStringUsingEncoding:NSASCIIStringEncoding];
    NSData *keyData=[NSData dataWithBytes:s length:strlen(s)];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH]={0};
    CC_SHA256(keyData.bytes, keyData.length, digest);
    NSData *out=[NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    NSString *hash=[out description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}

@end
