code challenge
==============

Você foi contratado para construir um webservice REST para o metro de Londres. Você recebeu os arquivos em [1] para alimentar o banco de dados desse serviço. 

* Você deve criar um método para importar os arquivos existentes e uma estrutura para armazenar os dados, a importação deve ser feita apenas uma vez. 

Ao finalizar a primeira parte, as seguintes funcionalidades foram pedidas pelo time de **mobile** para que eles possam construir uma aplicação para auxiliar no deslocamento dos passageiros. 

1. Um método que liste um caminho (contendo todas as estações) qualquer entre a estação X e a estação Y 
2. Um método que liste o menor caminho (contendo todas as estações) (considerando a quantidade de paradas como requisito para o menor caminho) entre a estação X e a estação Y
3. Um método que calcule o tempo aproximando da viagem no item 2, considerando que ao passar de uma estação adjacente à próxima, o passageiro gaste 3 minutos e ao trocar de linha gaste 12 minutos. 

Observações: 

* Tanto o desenho da arquitetura do serviço assim como os testes unitários fazem parte da resolução do teste. 
* O retorno do webservice REST deve ser em XML ou JSON 
* O código deve ser hospedado em um repositório forkado a partir desse no github. 
* Ao terminar o teste mande um email para techjobs@brasilct.com com seu curriculum e o link para seu repositório.


Recursos: 
[1] https://commons.wikimedia.org/wiki/London_Underground_geographic_maps/CSV (para facilitar os arquivos foram inseridos no respositório.) 


Para Verificar Funcionamento
----------------------------
* local:
  * clone o repositorio.
  * bundle
  * rake db:migrate
  * carregar as informações do metro:
    1. rake load_metro_data:load_lines         
    2. rake load_metro_data:load_routes        
    3. rake load_metro_data:load_stations
  * rails s
  * Pronto voce pode usar a aplicação com algum cliente http como curl, ex:
  ```
  curl 'http://localhost:3000//directions/simple_path.json?orig=1&dest=5'
  [{"id":"73"},{"id":"182"},{"id":"194"},{"id":"5"}]
  curl 'http://localhost:3000//directions/simple_path.json?orig=1&dest=9'
  [{"id":"265"},{"id":"110"},{"id":"17"},{"id":"74"},{"id":"99"},{"id":"236"},{"id":"229"},{"id":"273"},{"id":"107"},{"id":"192"},{"id":"277"},{"id":"89"},{"id":"145"},{"id":"123"},{"id":"95"},{"id":"160"},{"id":"266"},{"id":"303"},{"id":"31"},{"id":"9"}]
  ```