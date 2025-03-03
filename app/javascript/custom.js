let boxes = document.querySelectorAll(".btn1");
let resetBtn = document.querySelector("#reset-btn");
let turn0 = true;

const winPatterns = [
    [0, 1, 2],
    [0, 3, 6],
    [0, 4, 8],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6], // Fixed incorrect pattern
    [3, 4, 5],
    [6, 7, 8]
];

boxes.forEach((box) => {
    box.addEventListener("click", () => {
        if (box.innerText !== "") return; // Prevent overwriting moves

        box.innerText = turn0 ? "O" : "X"; // Assign the current player's symbol

        // ✅ Check the winner BEFORE switching turns
        if (checkWinner()) {
            setTimeout(() => {
                alert(`${turn0 ? "O" : "X"} wins!`);
                resetGame();
            }, 100);
            return; // Prevents further moves after the game is won
        }

        turn0 = !turn0; // Now switch turns AFTER checking the winner
    });
});

function checkWinner() {
    return winPatterns.some(pattern => {
        const [a, b, c] = pattern;
        return (
            boxes[a].innerText &&
            boxes[a].innerText === boxes[b].innerText &&
            boxes[a].innerText === boxes[c].innerText
        );
    });
}

// Reset Button Functionality
resetBtn.addEventListener("click", resetGame);

function resetGame() {
    boxes.forEach((box) => {
        box.innerText = ""; // Clear all boxes
    });
    turn0 = true; // Reset turn to "O"
}
