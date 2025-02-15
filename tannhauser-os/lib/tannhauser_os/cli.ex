defmodule TannhauserOS.CLI do
    use GenServer
  
    # Register Unix commands as functions
    defmacro __using__(_opts) do
      quote do
        import TannhauserOS.CLI.Helpers
      end
    end
  
    # Helpers for commands (e.g. `ls` calls `File.ls!()`)
    defmodule Helpers for
      defmacro defunix(command, do: block) do
        quote do
          def unquote(String.to_atom(command))(args \\ []) do
            unquote(block)
          end
        end
      end
    end
  end
  
  # Transparent Unix commands (e.g. `ls` in REPL)
  defmodule TannhauserOS.CLI.Commands do
    use TannhauserOS.CLI
  
    defunix "ls" do
      case System.cmd("ls", args) do
        {output, 0} -> output
        _ -> "Error"
      end
    end
  
    defunix "ps" do
      System.cmd("ps", ["aux"]) |> elem(0)
    end
  
    # BEAM Commands
    defunix "nodes" do
      Node.list()
    end
  end