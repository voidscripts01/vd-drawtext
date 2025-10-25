/* * vd-drawtext
 * Version: 1.0.0
 * Author: KITSO
 *
 * Please do not remove this credit.
 */

document.addEventListener('DOMContentLoaded', function () {
    // Log credit to the F8 NUI console
    console.log("vd-drawtext UI loaded. Created by KITSO.");

    // Cache DOM elements
    const container = document.getElementById('drawtext-container');
    const keyElement = document.getElementById('key');
    const messageElement = document.getElementById('message');
    const body = document.body;

    // Listen for messages from Lua
    window.addEventListener('message', function (event) {
        let data = event.data;

        // Use a switch statement for cleaner action handling
        switch (data.action) {
            case 'show':
                // Add class to trigger the key spin animation
                container.classList.add('anim-key-ring-spin');
                
                keyElement.textContent = data.key.toUpperCase();
                messageElement.textContent = data.message;
                
                // Add 'visible' class to body to trigger show animations
                body.classList.add('visible');
                break;

            case 'hide':
                // Remove 'visible' class to trigger hide animations
                // The 'anim-key-ring-spin' class is intentionally not removed
                // as the CSS handles the spin-out animation on hide.
                body.classList.remove('visible');
                break;

            default:
                // Optional: log unhandled actions
                // console.log('Unknown action:', data.action);
                break;
        }
    });
});