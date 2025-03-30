const int PINO_SENSOR_TEMPERATURA = A2; // Variável constante com valor inteiro, e está atribuindo o valor da porta analogica A2 a variável
float temperaturaCelsius; // Exibir a temperatura em valores decimais

void setup() { // void é uma função que não retorna,
    Serial.begin(9600);// inicia a taxa de transferencia da placa em 9600

}

void loop() { // Coletar dados constatemente
    int valorLeitura = analogRead(PINO_SENSOR_TEMPERATURA); // O valorLeitura é uma atribuição de formato int ao que a porta analogica está lendo atraves do sensor
    temperaturaCelsius = (valorLeitura * 5.0 / 1023.0) / 0.01; // A variavel global temperaturaCelsius é igual ao valor lido da porta analogica vezes o cálculo
    float ajuste;
    ajuste = temperaturaCelsius - 19;

    Serial.print("TempMaximo:"); // É a exibição do texto antes dos dados
    Serial.print(8); // É a exibição dos dados coletados
    Serial.print(" "); // É a exibição do texto depois dos dados
    Serial.print("Temperatura:");
    Serial.print(ajuste);
    Serial.print(" ");
    Serial.print("TempMinimo:");
    Serial.println(2);

    delay(2000); // O intervalo da repetição da função loop

}