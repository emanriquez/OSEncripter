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
    // Do any additional setup after loading the view, typically from a nib.
    NSString *encriptado = [Seguridad encriptarTexto:@"HOLA" :@"secreto_privado"];
    _texto.text = encriptado;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
