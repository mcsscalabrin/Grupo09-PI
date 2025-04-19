const int PINO_SENSOR_TEMPERATURA = A0; // Variável constante com valor inteiro, e está atribuindo o valor da porta analogica A2 a variável
float temperaturaCelsius; // Exibir a temperatura em valores decimais

void setup() { // void é uma função que não retorna,
    Serial.begin(9600);// inicia a taxa de transferencia da placa em 9600

}

void loop() { // Coletar dados constatemente
    int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA); // O valorLeitura é uma atribuição de formato int ao que a porta analogica está lendo atraves do sensor
    temperaturaCelsius = (valorLeitura * 5.0 / 1023.0) / 0.01; // A variavel global temperaturaCelsius é igual ao valor lido da porta analogica vezes o cálculo
    temperaturaCelsius = temperaturaCelsius - 19;


    Serial.print(temperaturaCelsius);
    Serial.println(";");
    
    delay(2000); // O intervalo da repetição da função loop

}