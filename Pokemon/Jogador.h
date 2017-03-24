//
//  Jogador.h
//  Pokemon
//
//  Created by Afonso Lucas on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"

@interface Jogador : NSObject

@property (retain, nonatomic) NSString * nome;
@property (retain, nonatomic) NSMutableArray * pokemons;

-(id) initWithNome: (NSString *)nome;

-(void) addPokemon: (Pokemon *)currentPokemon;
-(void) capturarPokemon:(Pokemon *) pokemon;
-(void) listarPokemons;
-(void) batalharSelvagem: (Pokemon *) selvagem;
-(void)descartaPokemon:(NSInteger)indice pokemons:(NSMutableArray*)pokemons;

@end
