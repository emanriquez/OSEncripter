//
//  ViewController.m
//  Encriptador
//
//  Created by Osiris on 16-04-16.
//  Copyright © 2016 Osiris. All rights reserved.
//

#import "ViewController.h"
#import "Seguridad.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *encriptado = [Seguridad encriptarTexto:@"holamundo" :@"1234" :@"claveprivada"];
    _textencriptado.text = encriptado;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
