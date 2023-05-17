#Para associar	um	valor ou	conteúdo a	um	nome ou variável, usam-se	os	operadores	<-     ou 	=. 
#Execute as instruções abaixo
x = 2 # pode ser usada em variáveis globais e locais
y <- 4 # Deve ser usada somente em variáveis globais.
Z <- x/4*100
#Como imprimir os valores de x, y e z no terminal?


# operações básicas
4+5
7-2
6*8
9/3
4^3
sqrt(25)

# Principais operadores:
  
valor <- 0.83   		 # Atribuição de valores (Indicado para escopo global) 
valor =  0.83   		 # Atribuição de valores (Indicado para escopo global e local)
valor < 0.9      		  # Menor (> para maior)
valor <= 0.83   		  # Menor ou igual (>= para maior ou igual)
valor == 9        		  # Igualdade
0 <= valor & valor <= 0.1 # Dois criterios aditivos
0 <= valor | valor <= 0.1   # Dois criterios, um ou outro
!valor == 0.83 		    # Inverter o argumento lógico


# Algumas funções:
log(x = 8) # Logaritmo natural de 8
log(x = 8, base = 2) # Logaritmo de 8 na base 2, especificando cada argumento 

rep(x = 1, times = 4) # Repetir o valor 1 quatro vezes
sum(1, 8, 79) # Soma de vários valores

#class(Objeto) # mostra o tipo de objeto

var1 <- 3
var2 <- 3L
var3 <- 3.0  
class(var1)
class(var2)
class(var3) 
class(as.integer(var1))
var4 <- as.numeric(var2)

class(var4)

#O que acontece se…?

var1 = 1 
var2 = '2'
var3 = TRUE

print(var1 + 2)
print(var1 + var3)
print(var2 + 1) #erro 

#Como realizar a última operação acima sem reatribuir valores a var2? 
  

#Estrutura IF 
idade = 18
if(idade<14){
  print('criança')
}

#Estrutura IF ELSE 
idade = 18
if(idade<14){
  print('criança')
}else{
  print('jovem ou adulto')
}

#Estrutura IF ELSE IF 
if(idade<14){
  print('criança')
}else if(idade>=14 & idade < 18 ){
    print('jovem')
  }else{
    print('adulto')
  }



# Laço FOR
idade = 18
for ( i in c(1:10)) {
  print(paste0('Imprimido laço ',i))
}

#Laço WHILE
a=1
while (a <=10 )  {
  print(paste0("Imprimindo laço ",a))
  a=a+1
}

# O vetor pode ser criado através da função c() ex:
vetor1 = c(2,4.2,5,4.88)  ## criando um vetor tipo numeric
vetor2 = c(FALSE, TRUE, TRUE) ## criando um vetor com valores lógicos (TRUE e FALSE)
vetor3 = c(NA, 9, 16, -1) ## NA indica que o valor é inexistente
vetor4 = rep(1,5) ## Vetor com valores repetidos utilizando a função rep() [rep(valor,repetições)]
vetor5 = rep("gato",3)   ## pode ser um vetor de "strings"
vetor6 = seq(1,2,0.2) ## Vetor com valores reais e espaçamento constante utilizando a função seq()  [seq(início,fim,espaçamento)]

# Criando um dataframe:

pacientes = data.frame(id = c("P1","P2","P3","P4"), 
                       sexo = c("feminino", "feminino", "masculino", "masculino"), 
                       peso=c(80, 85, 100, 95), idade = c(25, 32, 75, 61),
                       altura = c(150,191,170,156))



# IMPORTANDO BASE DE DADOS

futebol = read.csv('dados/campeonato-brasileiro-estatisticas-full.csv')

#Visualizando o arquivo

View(futebol)

#Verificando a quantidade de registros ou linhas:
nrow(futebol)

# Gerando um resumo estatístico

summary(futebol)

# Operação com vetores.

# Qual o total de gols que ocorreram no campeonato
qtd_gols = sum(futebol$chutes_no_alvo)
print(qtd_gols)

# Qual a média de gols por partida

qtd_partida = nrow(futebol)/2

media_gols = qtd_gols/qtd_partida
print(media_gols)

#Qual o quantitativo de partidas e gols  dos times cearenses
library(tidyverse)

resposta = futebol %>% 
  filter(clube=='Ceara' | clube == 'Fortaleza') %>% 
  group_by(clube) %>% 
  summarise(qtd_partida = n_distinct(partida_id),
            qtd_gols = sum(chutes_no_alvo) )

#Qual a media de gols dos times cearenses

resposta = resposta %>% 
  mutate(media_gols = qtd_gols/qtd_partida)
clubes = unique(resposta$clube)

barplot(resposta$qtd_gols,names.arg = resposta$clube)
