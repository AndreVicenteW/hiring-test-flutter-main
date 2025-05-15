# Entrega do desafio ténico

O desafio proposto foi realizado utilizando boas práticas de arquitetura e desenvolvimento.

Adicionei a nova tela proposta no desafio sem alterar o código que já havia no projeto.

Testes unitários foram adicionados para testar regras de negócio e UI.

Teste de integração foi adicionado, porém, como a tela é pequena e sem muita interação, foi apenas verificado se os items apareciam na tela de forma correta. 

#### Novas dependências:
- ```equatable```: para facilitar a validação de estados do Cubit
- ```flutter_bloc```: para gerenciamento de estado
- ```get_it```: para injeção de dependências
- ```intl```: para conversão de double para moeda brasileira
- ```bloc_test```: para testes unitários de bloc
- ```mocktail```: para mock de testes