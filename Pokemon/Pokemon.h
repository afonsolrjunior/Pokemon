//
//  Pokemon.h
//  Pokemon
//
//  Created by Afonso Lucas on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Pokemon : NSObject

@property (retain, nonatomic) NSString * nome;
@property (retain, nonatomic) NSString * tipo;
@property (assign, nonatomic) NSInteger  nivel;
@property (assign, nonatomic) NSInteger  exp;

-(id) initWithNome: (NSString *)nome Nivel: (NSInteger )nivel Tipo: (NSString *)tipo;
-(Boolean) subirdeNivel;

@end
