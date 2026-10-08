
#* Sistema de Gerenciamento de Produtos
#* Desenvolvimento em Python - Semana 04

#* Cria uma lista vazia para armazenar os produtos cadastrados
produtos = []

#* 1. Cadastro de produtos
#* Pergunta quantos produtos o usuário deseja cadastrar
quantidade = int(input("Quantos produtos deseja cadastrar? "))

#* Repete o cadastro de acordo com a quantidade informada
for i in range(quantidade):
    print(f"\n--- Cadastro do produto {i + 1} ---")

    #* Recebe o nome, o preço e a categoria do produto
    nome = input("Nome do produto: ")
    preco = float(input("Preço do produto: R$ "))
    categoria = input("Categoria do produto: ")

    #* Agrupa os dados de cada produto em um dicionário
    produto = {
        "nome": nome,
        "preco": preco,
        "categoria": categoria
    }

    #* Adiciona o produto à lista principal
    produtos.append(produto)

#* 2. Filtragem por preço
print("\n--- Filtragem por preço ---")

#* Recebe o preço utilizado como referência para a filtragem
limite_preco = float(input("Digite o preço de referência: R$ "))

#* Exibe os produtos com preço superior ao limite informado
print(f"\nProdutos acima de R$ {limite_preco:.2f}:")

for produto in produtos:
    if produto["preco"] > limite_preco:
        print(
            f"Produto: {produto['nome']} | "
            f"Preço: R$ {produto['preco']:.2f} | "
            f"Categoria: {produto['categoria']}"
        )

#* Exibe os produtos com preço inferior ao limite informado
print(f"\nProdutos abaixo de R$ {limite_preco:.2f}:")

for produto in produtos:
    if produto["preco"] < limite_preco:
        print(
            f"Produto: {produto['nome']} | "
            f"Preço: R$ {produto['preco']:.2f} | "
            f"Categoria: {produto['categoria']}"
        )

#* 3. Ordenação por preço

#* Cria uma cópia da lista para ordenar sem alterar a lista original
produtos_crescente = produtos.copy()

#* Ordena os produtos do menor preço para o maior
produtos_crescente.sort(key=lambda produto: produto["preco"])

#* Cria uma nova lista ordenada do maior preço para o menor
produtos_decrescente = sorted(
    produtos,
    key=lambda produto: produto["preco"],
    reverse=True
)

#* Exibe os produtos em ordem crescente
print("\n--- Produtos em ordem crescente ---")

for produto in produtos_crescente:
    print(f"{produto['nome']}: R$ {produto['preco']:.2f}")

#* Exibe os produtos em ordem decrescente
print("\n--- Produtos em ordem decrescente ---")

for produto in produtos_decrescente:
    print(f"{produto['nome']}: R$ {produto['preco']:.2f}")

#* 4. Conjunto de categorias únicas

#* Cria um conjunto vazio para impedir categorias duplicadas
categorias = set()

#* Percorre os produtos e adiciona suas categorias ao conjunto
for produto in produtos:
    categorias.add(produto["categoria"])

#* Exibe as categorias sem repetições
print("\n--- Categorias únicas ---")

for categoria in sorted(categorias):
    print(categoria)

#* 5. Tupla de estatísticas

#* Verifica se existem produtos antes de calcular as estatísticas
if produtos:

    #* Cria uma lista contendo apenas os preços dos produtos
    precos = [produto["preco"] for produto in produtos]

    #* Calcula o menor preço, o maior preço e a média
    menor_preco = min(precos)
    maior_preco = max(precos)
    media_precos = sum(precos) / len(precos)

    #* Agrupa as estatísticas em uma tupla imutável
    estatisticas = (menor_preco, maior_preco, media_precos)

    #* 6. Relatório final
    print("\n========== RELATÓRIO FINAL ==========")

    #* Exibe todos os produtos cadastrados
    print("\nProdutos cadastrados:")

    for produto in produtos:
        print(
            f"Nome: {produto['nome']} | "
            f"Preço: R$ {produto['preco']:.2f} | "
            f"Categoria: {produto['categoria']}"
        )

    #* Exibe as estatísticas calculadas
    print("\nEstatísticas:")
    print(f"Menor preço: R$ {estatisticas[0]:.2f}")
    print(f"Maior preço: R$ {estatisticas[1]:.2f}")
    print(f"Média dos preços: R$ {estatisticas[2]:.2f}")

    #* Exibe a quantidade total de produtos e categorias
    print(f"\nQuantidade de produtos: {len(produtos)}")
    print(f"Quantidade de categorias únicas: {len(categorias)}")

#* Informa quando não existem produtos cadastrados
else:
    print(
        "\nNenhum produto cadastrado. "
        "Não foi possível calcular as estatísticas."
    )
