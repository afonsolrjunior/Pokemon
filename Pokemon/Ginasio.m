//
//  Ginasio.m
//  Pokemon
//
//  Created by Afonso Lucas on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Ginasio.h"
#import "Utils.h"
@implementation Ginasio

@synthesize nome = _nome;
@synthesize lider = _lider;

//Construtor personalizado
-(id) initWithNome: (NSString *)nome {
    self = [super init];
    
    if (self) {
        [self setNome:nome];
    }
    
    return self;
}

//Método para batalhar com o líder do ginásio
+(Jogador*)batalharGinasioLider:(Jogador*)lider jogador:(Jogador*)jogador{
    
    lider.pokemons = [Utils ordenaPokemon:lider.pokemons];
    jogador.pokemons = [Utils ordenaPokemon:jogador.pokemons];
    int flagJogador = 0, flagLider = 0;
    Pokemon *pokemon;
    
    for(int i = 0; i < 3; i++){
        pokemon =  [Utils batalharPokemon:lider.pokemons[i] Pokemon: jogador.pokemons[i]];
        
        if(pokemon == lider.pokemons[i]){
            flagLider++;
        }else{
            flagJogador++;
        }
    }
    
    if(flagLider > flagJogador ){
        return nil;
    }else{
        return jogador;
    }
}
@end
