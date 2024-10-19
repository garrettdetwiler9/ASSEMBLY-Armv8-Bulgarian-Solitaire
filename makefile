playBS: main.o roundConfig.o arrangePiles.o roundZero.o modulo.o playRound.o printRound.o
	gcc -o playBS main.o roundConfig.o arrangePiles.o roundZero.o modulo.o playRound.o printRound.o


main.o: main.s
	gcc -c main.s

roundConfig.o: roundConfig.s
	gcc -c roundConfig.s

arrangePiles.o: arrangePiles.s
	gcc -c arrangePiles.s

roundZero.o: roundZero.s
	gcc -c roundZero.s

modulo.o: modulo.s
	gcc -c modulo.s

playRound.o: playRound.s
	gcc -c playRound.s

printRound.o: printRound.s
	gcc -c printRound.s

clean: 
	rm *.o
