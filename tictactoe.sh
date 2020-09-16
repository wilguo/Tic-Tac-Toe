#!/bin/bash
# comment

declare -A board
num_rows=3
num_columns=3
current_player=2
x=0
y=0
player_move=0
game_over=0

print_gameboard(){
	for i in `seq 1 $num_rows`
	do
	    for j in `seq 1 $num_columns`
	    do
		printf "%c " ${board[$i,$j]}
	    done
	    printf "\n"
	done

}

make_move(){
    convert_move
    if test $current_player -eq 1
    then
        board[$x,$y]=x
    else
        board[$x,$y]=o
    fi
}

check_gameover(){

    if [ ${board[1,1]} != - ] && [ ${board[1,1]} = ${board[1,2]} ] && [ ${board[1,1]} = ${board[1,3]} ]
    then
        game_over=1
    elif [ ${board[2,1]} != - ] && [ ${board[2,1]} = ${board[2,2]} ] && [ ${board[2,1]} = ${board[2,3]} ]
    then
        game_over=1
    elif [ ${board[3,1]} != - ] && [ ${board[3,1]} = ${board[3,2]} ] && [ ${board[3,1]} = ${board[3,3]} ]
    then
        game_over=1
    elif [ ${board[1,1]} != - ] && [ ${board[1,1]} = ${board[2,1]} ] && [ ${board[1,1]} = ${board[3,1]} ]
    then
        game_over=1
    elif [ ${board[1,2]} != - ] && [ ${board[1,2]} = ${board[2,2]} ] && [ ${board[1,2]} = ${board[3,2]} ]
    then
        game_over=1
    elif [ ${board[1,3]} != - ] && [ ${board[1,3]} = ${board[3,2]} ] && [ ${board[1,3]} = ${board[3,3]} ]
    then
        game_over=1
    elif [ ${board[1,1]} != - ] && [ ${board[1,1]} = ${board[2,2]} ] && [ ${board[1,1]} = ${board[3,3]} ]
    then
        game_over=1
    elif [ ${board[1,3]} != - ] && [ ${board[1,3]} = ${board[2,2]} ] && [ ${board[1,3]} = ${board[3,1]} ]
    then
        game_over=1
    fi


}

convert_move(){
    case $player_move in
        1)
            x=1
            y=1
            ;;
        2)
            x=1
            y=2
            ;;
        3)
            x=1
            y=3
            ;;
        4)
            x=2
            y=1
            ;;
        5)
            x=2
            y=2
            ;;
        6)
            x=2
            y=3
            ;;
        7)
            x=3
            y=1
            ;;
        8)
            x=3
            y=2
            ;;
        9)
            x=3
            y=3
            ;;
    esac
}



#Initalize gameboard
for i in `seq 1 $num_rows`
do
    for j in `seq 1 $num_columns`
    do
	board[$i,$j]=-
    done
done

printf "=======================================\n"
printf "============= INSTRUCTIONS ============\n"
printf "=======================================\n"
printf "Type 1-9 to make a move\n"
printf "Player 1 is x\n"
printf "Player 2 is o\n"
printf "=======================================\n"
printf "\n"

while test $game_over -eq 0
do
        print_gameboard

        if test $current_player -eq 1
        then
            printf "Player 2's move: "
            current_player=2
            read player_move
        else
            printf "Player 1's move: "
            current_player=1
            read player_move
        fi

        make_move
        check_gameover
done

print_gameboard
if test $current_player -eq 1
then
    printf "Player 1 won!\n"
else
    printf "Player 2 won!\n"
fi









