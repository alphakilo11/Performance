Imports System.Diagnostics

Module Module1
    Function nth_prime(ByVal n As Integer) As Integer
        If n <= 0 Then Return Nothing
        Dim primes As List(Of Integer) = New List(Of Integer)({2})
        Dim num As Integer = 3
        While primes.Count < n
            Dim is_prime As Boolean = True
            Dim sqrt_num As Integer = CInt(Math.Sqrt(num)) + 1
            For Each p As Integer In primes
                If p > sqrt_num Then Exit For
                If num Mod p = 0 Then
                    is_prime = False
                    Exit For
                End If
            Next
            If is_prime Then primes.Add(num)
            num += 2
        End While
        Return primes.Last
    End Function

    Sub Main()
        Dim sw As Stopwatch = Stopwatch.StartNew()
        For i As Integer = 0 To 9
            Console.WriteLine(nth_prime(50000))
        Next
        sw.Stop()
        Console.WriteLine($"Dauer: {sw.Elapsed.TotalSeconds}")
    End Sub
End Module
