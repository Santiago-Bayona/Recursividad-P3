defmodule Taller do
  def main() do
    transferencias = [-200, 300, 500, -450]

    IO.puts("El balance es: #{balance(transferencias)}")

    numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    IO.puts("La suma de los pares es: #{sumar_pares(numeros)}")

    matriz2 = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]

    suma_matriz = matriz(matriz2)

    IO.puts("la suma de la matriz es #{suma_matriz}")

    lista = [1, 2, 3, 4]

    IO.inspect(generar(lista))

    IO.puts("El factorial es: #{factorial(5)}")
  end

  "--------------------------------- Punto 1----------------------------"

  @doc """
  Caso base factorial(1) = 1
  """
  def factorial(1) do
    1
  end

  @doc """
  Caso recursivo factorial(n) = n * factorial(n-1)
  """
  def factorial(n) do
    if n > 0 do
      factorial(n - 1) * n
    else
      IO.puts("Numero negativo")
    end
  end

  "------------------------------ Punto 3-------------------------------"

  @doc """
  Caso base balance([]) = 0
  """
  def balance([]) do
    0
  end

  @doc """
  Caso recursivo balance([h|t]) = h + balance(t)
  """
  def balance([h | t]) do
    h + balance(t)
  end

  "-------------------------------- Punto 11 --------------------------------"

  @doc "Caso base fila([]) = 0"
  def fila([]) do
    0
  end

  @doc "Caso recursivo fila([h|t]) = h + fila(t)"
  def fila([h | t]) do
    h + fila(t)
  end

  @doc "Caso recursivo matriz([])"
  def matriz([h | t]) do
    fila(h) + matriz(t)
  end

  @doc "Caso base matriz([]) = 0"
  def matriz([]) do
    0
  end

  " ---------------------------------- Punto 9 -------------------------------- "
  @doc "Caso base generar([])"
  def generar([]), do: [[]]

  @doc "Caso recursivo generar(lista)"
  def generar(lista) do
    permutar(lista, [])
  end

  @doc "Caso base permutar([], acumulador)"
  defp permutar([], _acumulador), do: []

  @doc "Caso recursivo permutar([head|tail], resto)"
  defp permutar([head | tail], resto) do
    perms_restantes = generar(resto ++ tail)

    combinadas = agregar(head, perms_restantes)

    combinadas ++ permutar(tail, resto ++ [head])
  end

  @doc "Caso base agregar(_, [])"
  defp agregar(_x, []), do: []
  @doc "Caso recursivo agregar(x, [p | ps])"
  defp agregar(x, [p | ps]), do: [[x | p] | agregar(x, ps)]

  "-------------------------------- Punto 7 -------------------------------- "
  @doc "
  Caso base sumar_pares([]) = 0
  "
  def sumar_pares([]) do
    0
  end

  @doc "
  Caso recursivo sumar_pares([h|t])
  "
  def sumar_pares([h | t]) do
    if rem(h, 2) == 0 do
      h + sumar_pares(t)
    else
      sumar_pares(t)
    end
  end
end

Taller.main()
