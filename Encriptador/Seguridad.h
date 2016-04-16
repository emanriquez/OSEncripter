//
//  Seguridad.h
//  SanEstebanCentenarioIdq
//
//  Created by Elias Manriquez Pro on 30-03-16.
//  Copyright © 2016 Osiris Tecnology Ltda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import "FBEncryptorAES.h"

@interface Seguridad : NSObject




+ (NSString *) encriptarTexto:(NSString*)texto :(NSString*)persona;
+(NSString*)base64forData:(NSData*)theData;
+(NSString*) sha256:(NSString *)clear;


@end
