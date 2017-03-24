//
//  Pokemon.m
//  Pokemon
//
//  Created by Afonso Lucas on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Pokemon.h"



@implementation Pokemon

@synthesize nivel = _nivel;
@synthesize tipo = _tipo;
@synthesize exp = _exp;
@synthesize nome = _nome;

//Construtor personalizado
-(id) initWithNome: (NSString *)nome Nivel: (NSInteger )nivel Tipo: (NSString *)tipo {
    self = [super init];
    
    if (self){
        
        [self setNome:nome];
        [self setNivel:nivel];
        [self setExp:0];
        [self setTipo:tipo];
    }
    
    return self;
}

//Método para verificar se o pokemon subiu de nivel
-(Boolean) subirdeNivel{
    if (_exp >= 100) {
         _exp = _exp - 100;
        _nivel++;
        return true;
    }
    return false;
}

@end
