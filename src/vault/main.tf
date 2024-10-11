
# Для чтения значения
data "vault_generic_secret" "vault_example" {
  path = var.secret_example_path
}

# Для записи
resource "vault_generic_secret" "vault_example2" {
  path = var.secret_example2_path

  data_json = jsonencode(var.secret_example2_value)
}

output "vault_example" {
  value = nonsensitive(data.vault_generic_secret.vault_example.data.test)
}

#содержимое секретное. поглядеть можно через консоль

#> data.vault_generic_secret.vault_example # а содержимое data то скрыто!


#> nonsensitive(data.vault_generic_secret.vault_example.data) #вот так можно подсмотреть все ключи и значения

#> nonsensitive(data.vault_generic_secret.vault_example.data).1 а вот так сожно извлечь конкретный ключ

#Чем хорош vault ? Это версионирование для секретов.
