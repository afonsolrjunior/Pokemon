//
//  Jogador.m
//  Pokemon
//
//  Created by Afonso Lucas on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Jogador.h"
#import "Utils.h"

@implementation Jogador

@synthesize nome =_nome;
@synthesize pokemons = _pokemons;

//Construtor personalizado
-(id) initWithNome: (NSString *)nome {
    self = [super init];
    if (self) {
        [self setNome:nome];
        _pokemons = [[NSMutableArray alloc] init];
    }
    
    return self;
}

//Método para adicionar um pokemon a lista de pokemons do jogador
-(void) addPokemon:(Pokemon *)currentPokemon {
    if ([self.pokemons count] < 5)
        [_pokemons addObject: currentPokemon];
    
    else
        printf("Você já possui 5 pokemons!!!");
}

//Método para capturar um pokemon
-(void) capturarPokemon:(Pokemon *) pokemon {
     char opcao;
    
    if([self.pokemons count]>=5){
        [Utils lerCharWithOpcao:&opcao Mensagem: "Ops!! você já tem 5 pokémons.\nDeseja descartar algum? (S/N)" Opcoes:"SN"];
        if(opcao=='S'){
            int indice = 0;
            printf("Informe o número do pokémon que deseja descartar");
            [self listarPokemons];
            [Utils lerInteiro:&indice];
            [self descartaPokemon:indice pokemons:[self pokemons]];
        }else{
            return;
        }
    }
    
    if ([self.pokemons count] < 5) {
       
        printf("A wild %s lvl %lu appears!!!", [pokemon.nome UTF8String], pokemon.nivel);
        [Utils lerCharWithOpcao:&opcao Mensagem: "Deseja captura-lo? (S/N)" Opcoes:"SN"];
        if (opcao == 'S') {
            if ([Utils gerarNumeroAleatorioMin:0 maximo:100] <= 30) {
                [self addPokemon:pokemon];
                printf("%s capturado!!!", [pokemon.nome UTF8String]);
            } else
                printf("%s escapou!!!", [pokemon.nome UTF8String]);
            
        } else
            return;
    } else
        printf("Você já possui 5 pokemons!!!");
    
}

//Método para listar os pokemons do jogador
-(void) listarPokemons {
    int i = 0;
    if ([_pokemons count] == 0)
        printf("Voce nao possui pokemons!!!");
    else {
        //[Utils ordenarWithArray:_pokemons];
        for (Pokemon* pokemon in _pokemons) {
            printf("\n%d - Pokemon = %s - lvl %lu",++i, [pokemon.nome UTF8String], pokemon.nivel);
        }
        printf("\n");
    }
    
}

//Método para batalhar com um pokemon selvagem
-(void) batalharSelvagem: (Pokemon *) selvagem {
    if ([_pokemons count] == 0)
        printf("Voce nao possui pokemons!!!");
    else {
        if (_pokemons[0] == [Utils batalharPokemon:_pokemons[0] Pokemon:selvagem]) {
            printf("Voce foi o vencedor!!!");
        } else
            printf("Voce perdeu!!!");
    }
}


-(void)descartaPokemon:(NSInteger)indice pokemons:(NSMutableArray*)pokemons{
    [pokemons removeObjectAtIndex:indice];
}






@end
