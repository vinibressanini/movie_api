## All in One Movie App

App criado com o intuíto de treinar conceitos como Clean Code e Clean Architecture, além de algumas ferramentas e packages do Flutter como Riverpod, DIO, Envied
O App consome a API do TMDB (https://www.themoviedb.org/?language=pt-BR) e retorna as tendências diárias e semanais contendo: Nome, imagem do poster, avaliação e data de lançamento. Ao clicar em determinado filme o usuário entrará na página de detalhed onde o mesmo poderá ver informações como o trailer, sinopse, gêneros, lucro do filme, data de lançamento, avalição dos usuários, principais atores e em quais plataformas de streaming está disponível (no Brasil).


## Preview





https://github.com/vinibressanini/movie_api/assets/91560062/5ef8b301-64d5-425f-96e0-79d747b4fbd3




## Como Utilizar?

Primeiramente clone o projeto para a sua máquina e dê um CTRL + S no pubspec.yaml, isso fará com que baixe todas as dependências para o projeto iniciar. O próximo passo será criar uma chave de API do TMDB, como utilizei o Envied para ocultar a minha key, você terá que fazer o mesmo, por motivos óbvios :). Aqui na documentação tem o passo a passo de como criar a API KEY https://developers.themoviedb.org/3/getting-started/introduction.

![image](https://user-images.githubusercontent.com/91560062/230795385-2ad24d48-12c7-4950-ad21-42e8b53c6b3e.png)

Uma vez criada a chave, crie uma documento .env na raiz do projeto com a seguinte informação:

- TMDB_KEY='sua_key'
- API_BASE_URL=https://api.themoviedb.org/3/
- API_IMAGE_URL=https://image.tmdb.org/t/p/w500/

No terminal rode o seguinte comando *flutter pub run build_runner build --delete-conflicting-outputs*, o build_runner vai gerar o arquivo com a sua chave o app esta pronto para ser usado.


## Tecnologias Utilizadas

- Flutter 3.3.4
- Dart 2.18.2
- Dio (https://pub.dev/packages/dio)
- Hooks Riverpod (https://pub.dev/packages/hooks_riverpod)
- Youtube Player (https://pub.dev/packages/youtube_player_flutter)
- Shimmer (https://pub.dev/packages/shimmer)
- Envies (https://pub.dev/packages/envied)
