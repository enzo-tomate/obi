computador=[]


for x in range(5):
    nome = input ("Digite o nome do %dº item: "%(x+1))
    computador.append (nome)

tamanho = len(computador)

print (" Seu itens escolhidos foram :")
for y in range(tamanho):
    print (computador[y])
    
