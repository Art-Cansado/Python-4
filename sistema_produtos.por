
programa
{
    funcao inicio()
    {
        // Variaveis principais
        cadeia nomes[100]
        cadeia categorias[100]
        cadeia categorias_unicas[100]
        cadeia auxiliar_nome
        cadeia auxiliar_categoria

        real precos[100]
        real precos_ordenados[100]
        real auxiliar_preco
        real limite_preco
        real menor_preco
        real maior_preco
        real soma_precos
        real media_precos

        inteiro quantidade
        inteiro quantidade_categorias
        inteiro i, j
        inteiro total_unicos
        inteiro posicao
        inteiro repetido

        // 1. Cadastro dos produtos
        escreva("Quantos produtos deseja cadastrar? ")
        leia(quantidade)

        enquanto (quantidade < 1 ou quantidade > 100)
        {
            escreva("Informe uma quantidade entre 1 e 100: ")
            leia(quantidade)
        }

        para (i = 0; i < quantidade; i++)
        {
            escreva("\n--- Cadastro do produto ", i + 1, " ---\n")

            escreva("Nome do produto: ")
            leia(nomes[i])

            escreva("Preco do produto: R$ ")
            leia(precos[i])

            escreva("Categoria do produto: ")
            leia(categorias[i])
        }

        // 2. Filtragem por preco
        escreva("\nDigite o preco de referencia: R$ ")
        leia(limite_preco)

        escreva("\nProdutos acima de R$ ", limite_preco, ":\n")

        para (i = 0; i < quantidade; i++)
        {
            se (precos[i] > limite_preco)
            {
                escreva(nomes[i], " - R$ ", precos[i],
                        " - ", categorias[i], "\n")
            }
        }

        escreva("\nProdutos abaixo de R$ ", limite_preco, ":\n")

        para (i = 0; i < quantidade; i++)
        {
            se (precos[i] < limite_preco)
            {
                escreva(nomes[i], " - R$ ", precos[i],
                        " - ", categorias[i], "\n")
            }
        }

        // 3. Copia os precos para um vetor auxiliar
        para (i = 0; i < quantidade; i++)
        {
            precos_ordenados[i] = precos[i]
        }

        // Ordenacao crescente pelo metodo da bolha
        para (i = 0; i < quantidade - 1; i++)
        {
            para (j = 0; j < quantidade - 1 - i; j++)
            {
                se (precos_ordenados[j] > precos_ordenados[j + 1])
                {
                    auxiliar_preco = precos_ordenados[j]
                    precos_ordenados[j] = precos_ordenados[j + 1]
                    precos_ordenados[j + 1] = auxiliar_preco
                }
            }
        }

        escreva("\n--- Precos em ordem crescente ---\n")

        para (i = 0; i < quantidade; i++)
        {
            escreva("R$ ", precos_ordenados[i], "\n")
        }

        // Ordenacao decrescente por bubble sort
        para (i = 0; i < quantidade - 1; i++)
        {
            para (j = 0; j < quantidade - 1 - i; j++)
            {
                se (precos_ordenados[j] < precos_ordenados[j + 1])
                {
                    auxiliar_preco = precos_ordenados[j]
                    precos_ordenados[j] = precos_ordenados[j + 1]
                    precos_ordenados[j + 1] = auxiliar_preco
                }
            }
        }

        escreva("\n--- Precos em ordem decrescente ---\n")

        para (i = 0; i < quantidade; i++)
        {
            escreva("R$ ", precos_ordenados[i], "\n")
        }

        // 4. Simulacao manual de categorias unicas
        total_unicos = 0

        para (i = 0; i < quantidade; i++)
        {
            repetido = 0

            para (j = 0; j < total_unicos; j++)
            {
                se (categorias[i] == categorias_unicas[j])
                {
                    repetido = 1
                }
            }

            se (repetido == 0)
            {
                categorias_unicas[total_unicos] = categorias[i]
                total_unicos = total_unicos + 1
            }
        }

        escreva("\n--- Categorias unicas ---\n")

        para (i = 0; i < total_unicos; i++)
        {
            escreva(categorias_unicas[i], "\n")
        }

        // 5. Calculo das estatisticas
        menor_preco = precos[0]
        maior_preco = precos[0]
        soma_precos = 0

        para (i = 0; i < quantidade; i++)
        {
            soma_precos = soma_precos + precos[i]

            se (precos[i] < menor_preco)
            {
                menor_preco = precos[i]
            }

            se (precos[i] > maior_preco)
            {
                maior_preco = precos[i]
            }
        }

        media_precos = soma_precos / quantidade

        // 6. Relatorio final
        escreva("\n========== RELATORIO FINAL ==========\n")

        escreva("\nProdutos cadastrados:\n")

        para (i = 0; i < quantidade; i++)
        {
            escreva("Nome: ", nomes[i],
                    " | Preco: R$ ", precos[i],
                    " | Categoria: ", categorias[i], "\n")
        }

        escreva("\nEstatisticas:\n")
        escreva("Menor preco: R$ ", menor_preco, "\n")
        escreva("Maior preco: R$ ", maior_preco, "\n")
        escreva("Media dos precos: R$ ", media_precos, "\n")

        escreva("Quantidade de produtos: ", quantidade, "\n")
        escreva("Quantidade de categorias unicas: ",
                total_unicos, "\n")
    }
}
