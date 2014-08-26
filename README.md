#OSX SSHFS volume mount

Por uma necessidade interna criamos um script interativo para montagem de volumes SSHFS no OSX. Esse script está encapsulado numa app do Automator que facilita o processo.

##Utilização do shell script
Para rodar o script certifique-se de que o mesmo possui permissão para execução:

```bash
chmod a+x osx_sshfs_mount.sh
```

O script foi originalmente criado para funcionar com o Automator, portanto não possui um tratamento avançado de parâmetros uma vez que o próprio Automator injeta os argumentos no script. Os argumentos requeridos são:

 - $1: usuário remoto
 - $2: host remoto
 - $3: porta ssh do servidor remoto
 
Exceto pelo terceiro argumento, todos são obrigatórios. Se não informada, a porta padrão (22) será utilizada.

Executando o script:

```bash
./osx_sshfs_mount.sh nome_usuario endereço_server porta
```

Exemplo:

```bash
./osx_sshfs_mount.sh brunopossidonio 192.168.0.1 2222
```

##Automator

Recomendo utilizar o script pela app exportada pelo Automator. A diferença principal para o script é que no Automator pré-definimos o host e a porta, perguntando somente o nome do usuário para conexão.

É bem mais prático se a intenção for utilizar a mesma app numa rede de macs.

###Configurando
Abra a app no Automator e edite as variáveis HOST e PORT. Depois disso, salve em Applications e divirta-se.

![Configure o Automator](http://farm.div64.com/repos/osx_sshfs_mount/automator.jpg)