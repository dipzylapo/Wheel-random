const modal = document.getElementById('resultModal');
const modalResult = document.getElementById('modalResult');
const closeModal = document.getElementById('closeModal');

function spinWheel() {
    if (spinning) return;

    spinning = true;
    const spinTime = 3000; // Total spin time in ms
    const spinAngle = Math.random() * 360 + 720; // Random spin angle + 2 full rotations
    const spinIncrement = spinAngle / (spinTime / 16); // Angle increment per frame

    let currentAngle = 0;

    const spinInterval = setInterval(() => {
        currentAngle += spinIncrement;
        startAngle = (startAngle + (spinIncrement * Math.PI) / 180) % (2 * Math.PI);
        drawWheel();

        if (currentAngle >= spinAngle) {
            clearInterval(spinInterval);
            spinning = false;

            const selectedOptionIndex = Math.floor((options.length - (startAngle / (2 * Math.PI)) * options.length) % options.length);
            const selectedOption = options[selectedOptionIndex];

            // Show the result in the modal
            modalResult.textContent = `The wheel landed on: ${selectedOption}`;
            modal.style.display = 'block';
        }
    }, 16);
}

// Close the modal when the close button is clicked
closeModal.addEventListener('click', () => {
    modal.style.display = 'none';
});

// Close the modal when clicking outside of it
window.addEventListener('click', (event) => {
    if (event.target === modal) {
        modal.style.display = 'none';
    }
});
