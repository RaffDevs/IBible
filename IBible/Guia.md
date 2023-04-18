#  Guia de desenvolvimento e planejamento de IBible


## O que é o IBible?

 - O IBible é uma aplicativo de Biblia, onde o usuário vai poder ler o texto biblíco desejado, além de poder destacar e salvar os versículos favoritos.
 
 - O Objetivo do aplicativo não é comercial mas para aprendizado e amadurecimento do conhecimento em desenvolvimento iOS.
 
 ## Qual será a arquitetura utilizada?
 
  - Será usado o Clean Architecture juntamente com o MVVM-C
  
## Quais serão as tecnologias utilizadas?

 - Libs externas:
    * Swinject - Para injeção de depêndêcias.
    * BannerNotification - Para notificar visualmente alguma ação.
    
 - Origem dos dados:
  * Api - abibliadigital.com.br
  * Coredata para persistência local
    
## Como usuário vai usar o aplicativo?

 - Ao iniciar o aplicativo pela primeira vez o usuário será levado a tela de login do aplicativo para preencher dados como nome, email e senha. Depois os demais login serão necessários somente email e senha. 
 
 - Uma vez autenticado o usuário será levado a tela inicial onde contém o versículo do dia.
 
 - A outra tela possível de se acessar é a tela contendo os livros da Biblia que será uma TableView e ao clicar no livro desejado, será aberto uma modal com os versiculos daquele livro e ao clicar em um dos versículos será levado ao texto.
 
 - O usuário será capaz de salvar os versículos favoritos e destaca-los.
 
 
 ## Telas
 
 ### Login
 
 - A tela de login é necessária pois a api utilizada será requer que seja feito uma autenticação para o uso de requisições ilimitadas.
 
 - Ou seja essa tela de login será mais para cadastrar o usuário e garantir o uso livre. De tal maneira que uma vez feita o cadastro, não será necessário fazer o login novamente.
 
 Critérios de aceite:
 
    [] A tela de login deverá conter 4 campos, sendo eles: email, nome, senha e um checkbox verificando se o usuário deseja receber algum update.
    
    [] A senha deve conter no minímo 6 digitos. Será necessário adicionar uma validação.
    
    [] Os campos não podem ser vazios.
    
    [] Ao enviar os dados apresentar alguma mensagem para usuário seja de erro ou de sucesso.
    
    [] Se sucesso aramazenar o token (que não expira) no dispositivo.
    
    [] Adicionar uma validação na criação da tela verificando se o token existe. Se sim, redirecionar o usuário para a tela principal. Se não apresentar a tela de cadastro!
 

