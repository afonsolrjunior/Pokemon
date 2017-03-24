//
//  Ginasio.h
//  Pokemon
//
//  Created by Afonso Lucas on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jogador.h"

@interface Ginasio : NSObject

@property (retain, nonatomic) NSString * nome;
@property (retain, nonatomic) Jogador * lider;

-(id) initWithNome: (NSString *)nome;


+(Jogador*)batalharGinasioLider:(Jogador*)lider jogador:(Jogador*)jogador;

@end
