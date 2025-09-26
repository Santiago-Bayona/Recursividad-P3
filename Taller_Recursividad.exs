defmodule Recursividad do

defstruct valor: nil, izq: nil, der: nil

  def main() do
    productos = productos()
    total1 = sumar_cantidades(productos)
    IO.puts("El total de cantidad de productos pedidos: #{total1}")
    lista=[1,2,3,4,5]
    IO.puts("La cantidad de elementos es: #{contar_elementos(lista)}")
     resultado= presente(2, [4,8,4,2])
    IO.puts("El objeto esta: #{resultado}")
    IO.puts("#{potencia(3,3)}" )

     rutas = rutas_desde_raiz(arbol(), 22)
    IO.puts("Rutas con suma 22: #{inspect(rutas)}")




  end


  @doc "
  Caso base factorial(1) = 1
  "
  def factorial(1) do
    1
  end

  @doc "
  Caso recursivo factorial(n) = n * factorial(n-1)
  "
  def factorial(n) do
    if n > 0 do
      factorial(n-1) * n
    else
      IO.puts("Numero negativo")
    end
  end


    @doc "Caso base contar_elementos([]) = 0"
  def contar_elementos([]) do
    0
  end
  @doc "Caso recursivo contar_elementos([h|t]) = 1 + contar_elementos(t)"
  def contar_elementos([h|t]) do
    1 + contar_elementos(t)
  end




    @doc "Caso base potencia(_,0) = 1"
  def potencia(_,0) do
    1
  end

  @doc "Caso recursivo potencia(n,c) = n * potencia(n,c-1)"
  def potencia(n,c) do
    n * potencia( n,c-1)
  end



  @doc "Caso base presente(_,[]) = false"
  def presente(_,[]) do
    false
  end
  @doc "Caso recursivo presente(n,[h|t])"
  def presente(n,[h|t]) do
    if n == h do
      true
    else
      presente(n,t)
    end
  end



  @doc "Lista productos de una tienda"
  def productos() do
    [%{producto: "celular", cantidad: 3}, %{producto: "computador", cantidad: 4}, %{producto: "audifonos", cantidad: 2}, %{producto: "estuche", cantidad: 5}]
end

@doc "Sumar cantidades de productos en una tienda Productos([]) = "
def sumar_cantidades([])do
  0
end

@doc "Sumar cantidades de productos en una tienda Productos([h|t]) = h.cantidad + Productos(t)"
def sumar_cantidades([h|t])do
  h.cantidad + sumar_cantidades(t)
end

 def arbol() do
    %Recursividad{
      valor: 5,
      izq: %Recursividad{
        valor: 4,
        izq: %Recursividad{
          valor: 11,
          izq: %Recursividad{valor: 7, izq: nil, der: nil},
          der: %Recursividad{valor: 2, izq: nil, der: nil}
        },
        der: nil
      },
      der: %Recursividad{
        valor: 8,
        izq: %Recursividad{valor: 13, izq: nil, der: nil},
        der: %Recursividad{
          valor: 4,
          izq: nil,
          der: %Recursividad{valor: 1, izq: nil, der: nil}
        }
      }
    }
  end

  # Rutas con suma en árbol
  @doc "Caso base: nodo nil → no existen rutas"
  def rutas(nil, _objetivo, _acumulado), do: []

  @doc "Caso base especial (hoja): si acumulado + valor == objetivo → devolvemos la ruta"
  def rutas(%Recursividad{valor: v, izq: nil, der: nil}, objetivo, acumulado) do
    if acumulado + v == objetivo, do: [[v]], else: []
  end

  @doc "Caso recursivo: llamadas a izq y der, y agregamos v a cada ruta"
  def rutas(%Recursividad{valor: v, izq: izq, der: der}, objetivo, acumulado) do
    rutas_izq = rutas(izq, objetivo, acumulado + v)
    rutas_der = rutas(der, objetivo, acumulado + v)

    (for r <- rutas_izq, do: [v | r]) ++
      (for r <- rutas_der, do: [v | r])
  end

  @doc "Función de entrada: inicia desde raíz"
  def rutas_desde_raiz(arbol, objetivo), do: rutas(arbol, objetivo, 0)









end

Recursividad.main()
