       IDENTIFICATION DIVISION.
       PROGRAM-ID. nth_prime.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 N PIC 9(4) VALUE 10.
       01 PRIMES OCCURS 100 TIMES PIC 9(10) VALUE 2.
       01 NUM PIC 9(10) VALUE 3.
       01 SQRT_NUM PIC 9(10) VALUE 0.
       01 I PIC 9(10) VALUE 0.
       01 P PIC 9(10) VALUE 0.
       01 IS_PRIME PIC X VALUE 'T'.

       PROCEDURE DIVISION.
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N
               DISPLAY "Prime " I " : " CALL "nth_prime" USING I RETURNING PRIMES (I)
           END-PERFORM.

           DISPLAY "Dauer: " CALL "timer" USING BY VALUE 1 - start_time.
           STOP RUN.

       nth_prime SECTION.
           ACCEPT N.
           IF N <= 0
               DISPLAY "Invalid value for N."
               STOP RUN
           END-IF.

           PERFORM VARYING I FROM 1 BY 1 UNTIL I > N OR PRIMES (I) = 0
               COMPUTE SQRT_NUM = FUNCTION CEILING (SQRT (NUM))
               MOVE 1 TO IS_PRIME
               PERFORM VARYING P FROM 1 BY 1 UNTIL PRIMES (P) = 0 OR PRIMES (P) > SQRT_NUM
                   IF NUM MOD PRIMES (P) = 0
                       MOVE 0 TO IS_PRIME
                       EXIT PERFORM
                   END-IF
               END-PERFORM
               IF IS_PRIME = 1
                   ADD 1 TO I
                   MOVE NUM TO PRIMES (I)
               END-IF
               ADD 2 TO NUM
           END-PERFORM.

           MOVE PRIMES (N) TO FUNCTION RETURN.
       END.
