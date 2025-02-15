# Habilita comandos Unix transparentes
import TannhauserOS.CLI.Commands

# Alias para comandos
alias TannhauserOS.CLI.Commands, as: C

# Prompt personalizado
IEx.configure(
  default_prompt: "\n\e[32mTannhauserOS@#{Node.self()}\e[0m> ",
  alive_prompt: "\e[31mTannhauserOS\e[0m> "
)