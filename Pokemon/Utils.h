//
//  Utils.h
//  Pokemon
//
//  Created by Afonso Lucas on 20/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pokemon.h"
#import "Ginasio.h"
#import "Jogador.h"

@interface Utils : NSObject

+(Pokemon *) gerarPokemon;
+(int)gerarNumeroAleatorioMin:(int)min maximo:(int)max;
+(NSString*)gerarTipoAleatorio;
+(void) gerarGinasios:(NSMutableArray *)ginasios;
+(Jogador *) gerarLiderWithIndex: (int) index;
+(int) comparaLevelPokemon:(Pokemon *)pokemon1 Pokemon:(Pokemon *)pokemon2;
+(Pokemon *) comparaTipoPokemon:(Pokemon *)pokemon1 Pokemon:(Pokemon *)pokemon2;
+(void) atribuirExpPokemon:(Pokemon *)pokemon1 Pokemon:(Pokemon *)pokemon2;
+(Pokemon *) verificarVencedor:(Pokemon *)pokemon1 Pokemon:(Pokemon *)pokemon2;
+(Pokemon *) batalharPokemon:(Pokemon *)pokemon1 Pokemon:(Pokemon *)pokemon2;
+(void) lerCharWithOpcao:(char *) opcao Mensagem:(char *) mensagem Opcoes:(char *) opcoes;
+(int) lerIntWithMsg:(char *)msg;
+(NSMutableArray<Pokemon *>*) ordenaPokemon:(NSMutableArray<Pokemon*>*)pokemons;
+(void) subMenuGinasios:(NSMutableArray *)ginasios Jogador:(Jogador *)jogador;
+(void)lerInteiro:(int*)numero;

@end
