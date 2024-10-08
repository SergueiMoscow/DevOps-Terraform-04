[Задание](https://github.com/netology-code/ter-homeworks/blob/main/04/hw-04.md)

## [Задание 1](tasks/task1.md)
Копируем пример из [демонстрации] в папку [src/1](src/1)  

Объявляем переменные в [variables.tf](src/1/variables.tf)  

Создаём `personal.auto.tfvars` по образцу [`personal.auto.tfvars_example`](src/1/personal.auto.tfvars_example), добавляем также переменную с именем файла публичного ключа  
![personal vars](images/image01.png)  

Для избежания дублирования одного и того же модуля под разными именами объединяем два вызова модуля в цикл  
![cycle](images/image02.png)  

Если используем циклы, то нужно поменять и [`remote_state_outputs.tf`](src/1/remote_state_outputs.tf)  
![outptus](images/image11.png)  

и создаём локальную переменную в качестве списка map для каждой итерации цикла  
![locals](images/image03.png)  

Добавляем переменные для передачи в template  
![locals](images/image04.png)  

В [`template`](src/1/cloud-init.yml) подставляем эти переменные и добавляем установку nginx  
![template](images/image05.png)  

Запускаем `terraform init`, `terraform plan`, `terraform apply`  

Машины создались:  
![output](images/image06.png)  

![yandex](images/image07.png)  

Проверяем  
![nginx](images/image08.png)  
Метки  
![labels](images/image09.png)  
`module.vm_instances[0]`  
![console](images/image10.png)  

[Commit](https://github.com/SergueiMoscow/DevOps-Terraform-04/commit/05f69029fd21f55a790c1ad27417e6e757d15655)

## [Задание 2](tasks/task2.md)
Создаём каталог `modules`, в нём каталог для модуля `vpc`

Создаём [variables.tf](src/1/modules/vpc/variables.tf) для модуля

Создаём [main.tf](src/1/modules/vpc/main.tf) для модуля

Создаём [outputs.tf](src/1/modules/vpc/outputs.tf) для модуля

В основном [main.tf](src/1/main.tf) удаляем ресурсы сети и одной подети  
![delete network](images/image12.png)  

Вместо них вызываем модуль:  
![module](images/image13.png)  

Также меняем ссылки, вместо удалённых сети и подсети подставляем значения модуля:  
![change](images/image14.png)  

![change](images/image15.png)

После `terraform apply` видим такой вывод:  
![output](images/image16.png)

Из консоли `module.vpc_dev`  
![console](images/image17.png)
