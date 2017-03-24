//
//  Utils.m
//  Pokemon
//
//  Created by Afonso Lucas on 20/03/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

#import "Utils.h"

#import "Pokemon.h"
#import "Ginasio.h"
#import "Jogador.h"

typedef enum{
    agua,
    fogo,
    vento,
    
}tipoEnum;


@implementation Utils


//Método para gerar e retornar um pokemon aleatório
+(Pokemon *) gerarPokemon {
    NSDictionary *pokemons = @{@"Fogo0":@"Charmander",
                               @"Fogo1":@"Vulpix",
                               @"Fogo2":@"Growlithe",
                               @"Fogo3":@"Magmar",
                               @"Agua0":@"Vaporeon",
                               @"Agua1":@"Psyduck",
                               @"Agua2":@"Squirtle",
                               @"Agua3":@"Staryuu",
                               @"Vento0":@"Pidgey",
                               @"Vento1":@"Sparow",
                               @"Vento2":@"Gayrados",
                               @"Vento3":@"Bulbasaur"};
    NSString *chave = nil;
    chave = [Utils gerarTipoAleatorio];
    return [[Pokemon alloc] initWithNome:pokemons[chave] Nivel: [Utils gerarNumeroAleatorioMin:1 maximo:10] Tipo:([chave substringToIndex:([chave length] - 1)])];
}

//Método para gerar e retornar um número inteiro aleatório
+(int)gerarNumeroAleatorioMin:(int)min maximo:(int)max{
    return (arc4random_uniform(max) + min);
}

//Método para gerar e retornar um tipo de pokemon aleatório
+(NSString*)gerarTipoAleatorio{
    
    switch ([Utils gerarNumeroAleatorioMin:0 maximo:3]) {
        case 0:
            return [[NSString alloc] initWithFormat:@"Fogo%d",[Utils gerarNumeroAleatorioMin:0 maximo:3]];
            break;
        case 1:
            return [[NSString alloc] initWithFormat:@"Agua%d",[Utils gerarNumeroAleatorioMin:0 maximo:3]];
            break;
        case 2:
            return [[NSString alloc] initWithFormat:@"Vento%d",[Utils gerarNumeroAleatorioMin:0 maximo:3]];
            break;
        default:
            return nil;
            break;
    }
    
}

//Método para gerar e instanciar os ginásios com seus respectivos líderes
+(void) gerarGinasios:(NSMutableArray *)ginasios{
    NSString *nomeGinasio;
    Jogador *lider;
    Ginasio *ginasio;
    for (int i = 0; i < 4; i++) {
        switch (i) {
            case 0:
                nomeGinasio = @"Pewter";
                break;
            case 1:
                nomeGinasio = @"Cerulean";
                break;
            case 2:
                nomeGinasio = @"Vermilion";
                break;
            case 3:
                nomeGinasio = @"Saffron";
                break;
        }
        lider = [Utils gerarLiderWithIndex:i];
        ginasio = [[Ginasio alloc] initWithNome:nomeGinasio];
        [ginasio setLider:lider];
        [ginasios addObject:ginasio];
    }
}

//Método para gerar e retornar o líder para cada ginásio
+(Jogador *) gerarLiderWithIndex: (int) index{
    NSString * nome;
    Jogador *lider;
    switch (index) {
        case 0:
            nome = @"Brock";
            break;
        case 1:
            nome = @"Misty";
            break;
        case 2:
            nome = @"Lt. Surge";
            break;
        case 3:
            nome = @"Sabrina";
            break;
        default:
            nome = nil;
            break;
    }
    
    lider = [[Jogador alloc] initWithNome:nome];
    
    switch (index) {
        case 0:
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Geodude" Nivel:12 Tipo:@"Vento"]];
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Geodude" Nivel:13 Tipo:@"Vento"]];
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Onix" Nivel:14 Tipo:@"Vento"]];
            break;
        case 1:
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Staryu" Nivel:18 Tipo:@"Agua"]];
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Staryu" Nivel:19 Tipo:@"Agua"]];
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Starmie" Nivel:21 Tipo:@"Agua"]];
            break;
        case 2:
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Voltorb" Nivel:21 Tipo:@"Vento"]];
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Pikachu" Nivel:18 Tipo:@"Vento"]];
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Raichu" Nivel:24 Tipo:@"Vento"]];
            break;
        case 3:
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Kadabra" Nivel:38 Tipo:@"Fogo"]];
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Mr. Mine" Nivel:37 Tipo:@"Fogo"]];
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Venomoth" Nivel:38 Tipo:@"Fogo"]];
            [lider addPokemon: [[Pokemon alloc] initWithNome:@"Alakazam" Nivel:43 Tipo:@"Fogo"]];
            break;
        default:
            break;
    }
    return lider;
}

//Método para verificar e retornar o pokemon vencedor de uma batalha
+(Pokemon *) verificarVencedor:(Pokemon *)pokemonDesafiante Pokemon:(Pokemon *)pokemonDesafiado{
    Pokemon *pokemonAux;
    int diferencalevel = [Utils comparaLevelPokemon:pokemonDesafiante Pokemon:pokemonDesafiado];
    if(diferencalevel == 0) {
        pokemonAux = [Utils comparaTipoPokemon:pokemonDesafiante Pokemon:pokemonDesafiado];
        if(pokemonAux == nil) {
            switch (diferencalevel) {
                case 0:
                    if([Utils gerarNumeroAleatorioMin:0 maximo:1] == 0)
                        return pokemonDesafiante;
                    else
                        return pokemonDesafiado;
                    break;
                    
                case 1:
                    return pokemonDesafiante;
                    break;
                    
                case 2:
                    return pokemonDesafiado;
                    break;
            }
        }
        return pokemonAux;
    }
    if(diferencalevel == 1)
        return pokemonDesafiante;
    else
        return pokemonDesafiado;
}

//Método para retornar o pokemon vencedor através da comparação dos níveis de dois pokemons
+(int) comparaLevelPokemon:(Pokemon *)pokemonDesafiante Pokemon:(Pokemon *)pokemonDesafiado{
    if ((pokemonDesafiante.nivel - pokemonDesafiado.nivel) >= 3)
        return 1;
    if ((pokemonDesafiado.nivel - pokemonDesafiante.nivel) >= 3)
        return 2;
    return 0;
}

//Método para retornar o pokemon vencedor através da comparação dos tipos de dois pokemons
+(Pokemon *) comparaTipoPokemon:(Pokemon *)pokemonDesafiante Pokemon:(Pokemon *)pokemonDesafiado{
   if ([pokemonDesafiante.tipo isEqualToString:pokemonDesafiado.tipo])
        return nil;
    if ([pokemonDesafiante.tipo isEqualToString:@"Agua"] && [pokemonDesafiado.tipo isEqualToString:@"Vento"])
        return pokemonDesafiado;
    if ([pokemonDesafiante.tipo isEqualToString:@"Fogo"] && [pokemonDesafiado.tipo isEqualToString:@"Agua"])
        return pokemonDesafiado;
    if ([pokemonDesafiante.tipo isEqualToString:@"Vento"] && [pokemonDesafiado.tipo isEqualToString:@"Fogo"])
        return pokemonDesafiado;
    return pokemonDesafiante;
}

//Método para atribuir a experiencia para os pokemons apos a batalha entre os mesmos
+(void) atribuirExpPokemon:(Pokemon *)vencedor Pokemon:(Pokemon *)perdedor{
    [vencedor setExp:(vencedor.exp + 35)];
    [perdedor setExp:(perdedor.exp + 10)];
    
    if ([vencedor subirdeNivel])
        printf("%s subiu para o nível %li!!!", [vencedor.nome UTF8String], (long)vencedor.nivel);
    if ([perdedor subirdeNivel])
        printf("%s subiu para o nível %li!!!", [perdedor.nome UTF8String], (long)perdedor.nivel);
    
    
}

//Método para a batalha dos pokemons, retornando o  pokemon vencedor
+(Pokemon *) batalharPokemon:(Pokemon *)pokemon1 Pokemon:(Pokemon *)pokemon2 {
    Pokemon *pokemonVencedor = [Utils verificarVencedor:pokemon1 Pokemon:pokemon2];
    if ([pokemonVencedor isEqual:pokemon1]) {
        [Utils atribuirExpPokemon:pokemon1 Pokemon:pokemon2];
    }else{
         [Utils atribuirExpPokemon:pokemon2 Pokemon:pokemon1];
    }
    
    return pokemonVencedor;
}

//Método para ler e validar um char
+(void) lerCharWithOpcao:(char *)opcao Mensagem:(char *)mensagem Opcoes:(char *)opcoes {
    Boolean flag;
    do{
        flag = false;
        getchar();
        printf("%s", mensagem);
        (*opcao) = toupper(getchar());
        if (strchr(opcoes, (*opcao)) == nil) {
            printf("\nEntrada invalida!!!");
            getchar();
            flag = true;
        }
    }while(flag);
}

//Método para ler e retornar um int válido
+(int) lerIntWithMsg:(char *)msg{
    
    int aux,ret,flag;
    
    do{
        flag=0;
        printf("%s",msg);
        fflush(stdin);
        ret = scanf("%d",&aux);
        fflush(stdin);
        if(ret == 0){
            flag=1;
            printf("\napenas numeros,tente novamente.\n");
        }
    }while(flag==1);
    
    return aux;
}
//Método para ordenar o array de pokemons
+(NSMutableArray<Pokemon *>*) ordenaPokemon:(NSMutableArray<Pokemon*>*)pokemons{
    ///NSInteger nivel = 0;
    
    Pokemon *pokemon = [[Pokemon alloc]init];
    
    for (int i = 0; i < pokemons.count; i++)
    {
        for (int j = 0; j < pokemons.count; j++)
        {
            if (pokemons[i].nivel > pokemons[j].nivel)
            {
                //aqui acontece a troca, do maior cara  vaia para a direita e o menor para a esquerda
                pokemon = pokemons[i];
                pokemons[i] = pokemons[j];
                pokemons[j] = pokemon;
            }
        }
    }
    
    return pokemons;
}

//Método para escolher o ginasio a ser desafiado
+(void) subMenuGinasios:(NSMutableArray *)ginasios Jogador:(Jogador *)jogador {
    int opcaoMenu;
    Jogador *vencedor;
    opcaoMenu = [Utils lerIntWithMsg:"1 - Pewter\n2 - Cerulean\n3 - Vermilion\n4 - Saffron\n"];
    switch (opcaoMenu) {
        case 1:
            vencedor = [Ginasio batalharGinasioLider:([ginasios[0] lider]) jogador:jogador];
            break;
            
        case 2:
            vencedor = [Ginasio batalharGinasioLider:([ginasios[1] lider]) jogador:jogador];
            break;
            
        case 3:
            vencedor = [Ginasio batalharGinasioLider:([ginasios[2] lider]) jogador:jogador];
            break;
            
        case 4:
            vencedor = [Ginasio batalharGinasioLider:([ginasios[3] lider]) jogador:jogador];
            break;
    }
    if(vencedor != nil) {
        [ginasios[opcaoMenu - 1] setLider:vencedor];
        printf("Você é o novo lider do ginasio de %s", [[ginasios[opcaoMenu - 1] nome] UTF8String]);
    } else
        printf("O lider do ginasio de %s continua sendo %s", [[ginasios[opcaoMenu - 1] nome] UTF8String], [[[ginasios[opcaoMenu - 1] lider] nome] UTF8String]);
    
}

@end
