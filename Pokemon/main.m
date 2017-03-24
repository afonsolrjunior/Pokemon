//
//  main.m
//  Pokemon
//
//  Created by Afonso Lucas on 15/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"
#import "Ginasio.h"
#import "Jogador.h"
#import "Utils.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Jogador *ash = [[Jogador alloc] initWithNome:@"Ash"];
        NSMutableArray *ginasios = [[NSMutableArray alloc] init];
        [Utils gerarGinasios:ginasios];
        int opcaoMenu;
        do{
            opcaoMenu = [Utils lerIntWithMsg:"\n1 - Capturar\n2 - Listar Pokemons\n3 - Batalhar contra pokemon selvagem\n4 - Conquistar Ginasio\n5 - Encerrar o jogo\nOpção escolhida: "];
            switch (opcaoMenu) {
                case 1:
                    [ash capturarPokemon:[Utils gerarPokemon]];
                    break;
                    
                case 2:
                    [ash listarPokemons];
                    break;
                    
                case 3:
                    [ash batalharSelvagem:[Utils gerarPokemon]];
                    break;
                    
                case 4:
                    [Utils subMenuGinasios:ginasios Jogador:ash];
                    break;
                    
            }
        }while(opcaoMenu != 5);
        
        
        
    }
    return 0;
}

