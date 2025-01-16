programa
{
	inclua biblioteca Util
 --> U
 	const inteiro limite = 20				   // constante para representar max de itens na pilha
 	cadeia nome[limite], cabecalho_funcao          // vetor para o nome, titulo cabeçalho tela
	inteiro  quant, registro = 0    			// variavel registro = posição vetor
	caracter opcao
	
	funcao inicio()
	{
		limpa()  // limpa tela
		menu()  // Chama função menu
	}

	funcao menu()
	{
		cabecalho_funcao = "             MENU GERAL                "
		cabecalho()

		escreva("1 - Adicionar Livro a Estante \n")
		U.aguarde(175)  //animação menu
		escreva("2 - Listar Livros na Estante \n")
		U.aguarde(175)  //animação menu
		escreva("3 - Remover Livro da Estante \n")
		U.aguarde(175)  //animação menu
		escreva("4 - Remover Todos os Livros da Estante \n")
		U.aguarde(175)  //animação menu
		escreva("5 - Sair \n")
		U.aguarde(175)  //animação menu

		escreva("---------------------------------------- \n")
		U.aguarde(200)  //animação menu
		escreva("Informe a opção desejada: \n")
		leia(opcao)

		escolha(opcao)
		{
			caso '1':
			{
				empilhar()
				pare
			}
			caso '2':
			{
				listar()
				pare
			}
			caso '3':
			{
				desempilhar()
				pare
			}
			caso '4':
			{
				limpa_pilha()
				pare
			}
			caso '5':
			{
				sair()
				pare
			}
			caso contrario:  // Caso escolha opção diferente mostra mensagem de erro e chama função menu denovo
			{
				escreva("Opção inválida! \n")
				U.aguarde(3000)
				menu()
				pare
			}
		}
	}

	funcao empilhar()
	{
		cabecalho_funcao = "       ADICIONAR LIVROS A PILHA          "
		cabecalho()
		se((limite-registro > 0)) //total de posições - registro = registros disponiveis, se for maior que zero então há espaço para mais livros!
		{
			cabecalho_funcao = "       ADICIONAR LIVROS A PILHA         "
			cabecalho()
			escreva("Quantos livros gostaria adicionar a pilha?\n")
			leia(quant)
		
			se(quant > 0 e quant <= (limite - registro)) // se a quant de livros a emplinhar for ao menos 1 e igual ou menor a quant de espaço disponivel
			{
				inteiro contador = 0 // para executar a função de acordo com quantos livros o usuario quer empilhar
				enquanto(contador < quant)
				{
					cabecalho_funcao = "       ADICIONAR LIVROS A PILHA         "
					cabecalho()
					escreva("Informe o nome do Livro: \n")
					leia(nome[registro])
					U.aguarde(200)   // aguarda 2 sec
					cabecalho()
					escreva(nome[registro]," Foi adicionado com Sucesso a Pilha!\n")
					contador ++
					registro ++
					U.aguarde(500)
				}
			}
			senao se(quant == 0)
			{
				cabecalho_funcao = "       ADICIONAR LIVROS A PILHA         "
				cabecalho()
				escreva("A quantidade inserida é igual a zero!!")
			}
			senao se(quant > (limite-registro))
			{
				cabecalho_funcao = "       ADICIONAR LIVROS A PILHA         "
				cabecalho()
				escreva("A quantidade inserida excede a quantidade de espaço disponivel!\nO espaço disponivel é de: ", (limite-registro)," livro(s)\n")
			}
			senao // mensagem de erro e volta para o menu
			{
			cabecalho_funcao = "       ADICIONAR LIVROS A PILHA         "
			cabecalho()
			escreva("Atenção: Opção inválida! Tente novamente!\n")
			}
		
		}
		senao
		{
			escreva("A estante está cheia!!")
		}
		U.aguarde(1000)
		retorna()
	}

	funcao sair()
	{
		limpa()
		escreva("Finalizando o sistema em 03 segundos. . .")
		U.aguarde(1000) //animação contagem regressiva para fechar sistema

		limpa()
		escreva("Finalizando o sistema em 02 segundos. . .")
		U.aguarde(1000) //animação contagem regressiva para fechar sistema

		limpa()
		escreva("Finalizando o sistema em 01 segundos. . .")
		U.aguarde(1000) //animação contagem regressiva para fechar sistema
	}

	funcao listar()
	
	{
		cabecalho_funcao = "      LISTA DE LIVROS NA ESTANTE       "
		cabecalho()
		se(registro == 0) // se a variavel é igual a vazio, significa que nenhum livro foi colocado na estante
		{
			escreva("A estante está vazia..\n")
		}
		senao // exibe todos os livros
		{
			escreva("\n")
			para(inteiro i = 0;i < registro; i++)
				{
					escreva((i+1) + ". " + nome[i] + "\n")
				}
		}
		U.aguarde(1000)
		retorna()
	}

	funcao retorna()
	{
		cadeia enter
		escreva("\n"+"Aperte [ENTER] para sair.")
		leia(enter)
		menu()
	}

	funcao cabecalho()
	{
		limpa()
		escreva("========================================= \n")
		U.aguarde(50)  //animação menu
		escreva("|" + cabecalho_funcao + "|\n")
		U.aguarde(50)  //animação menu
		escreva("========================================= \n\n")
		U.aguarde(50)  //animação menu
	}

	funcao desempilhar()
	{
		cabecalho_funcao = "           Remover Livro da Estante            "
		cabecalho()
		cadeia confirma
		se(registro == 0) // se a variavel é igual a vazio, significa que não há livros na estante
		{
			escreva("A estante está vazia\n")
		}
		senao
		{
			escreva("Você confirma a remoção do livro no topo da pila?[S/N] ",registro," - ",nome[registro-1],"\n")
			leia(confirma)
			se(confirma == "S")
			{
				cabecalho()
				escreva(registro," - ",nome[registro-1], " Removido da pilha com Sucesso\n")
				nome[registro-1] = ""
				registro--
			}
			senao se(confirma == "N")
			{
				escreva("Ação cancelada...\n")
			}
			senao
			{
				escreva("Algo deu errado...Por favor digite S ou N.")
				U.aguarde(1000)
				desempilhar()
			}
		}
		U.aguarde(200)
		retorna()
	}

	funcao limpa_pilha()
	{
		limpa()
		se(registro == 0)
		{
			escreva("A estante está vazia...\n")
		}
		senao
		{
			cadeia confirma
			limpa()
			escreva("Você confirma esta ação? [S/N]: ")
			leia(confirma)
			se(confirma == "S")
			{
				para(inteiro i=0;i<registro;i++)
				{
					inteiro x = registro-1
					para(x; x > i; x--)
					{
						nome[x] = ""
					}
					registro = x
					limpa()
					escreva("\nTodos os Livros Removidos com Sucesso!\n")
				}
			}
			senao se(confirma == "N")
			{
				escreva("Ação cancelada...\n")
			}
			senao
			{
				escreva("Algo deu errado...Por favor digite somente S ou N.")
				U.aguarde(1000)
				limpa_pilha()
			}
			
		}
		U.aguarde(200)
		retorna()
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 5270; 
 * @DOBRAMENTO-CODIGO = [9, 15, 73, 129, 144, 165, 173, 219];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */