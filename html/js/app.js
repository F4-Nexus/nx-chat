window.addEventListener('load', () => {
  const chatInput = document.getElementById('message');

  if (chatInput) {
      chatInput.addEventListener('keyup', (event) => {
          if (event.key === 'Enter') {
              const message = chatInput.value.trim();
              if (message !== '') {
                  fetch('https://qb-zombie-chat/sendMessage', {
                      method: 'POST',
                      headers: {
                          'Content-Type': 'application/json; charset=UTF-8',
                      },
                      body: JSON.stringify({ message: message })
                  })
                  .then(response => {
                      if (!response.ok) {
                          throw new Error('Network response was not ok ' + response.statusText);
                      }
                      return response.json();
                  })
                  .catch(error => console.error('Error sending message:', error));
                  chatInput.value = '';
              }
          }
      });

      window.addEventListener('message', (event) => {
          if (event.data.action === 'openChat') {
              document.body.style.display = 'flex';
              chatInput.focus();
          } else if (event.data.action === 'closeChat') {
              document.body.style.display = 'none';
          }
      });

      fetch('https://qb-zombie-chat/closeChat', {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json; charset=UTF-8',
          },
      }).catch(error => console.error('Error closing chat:', error));
  } else {
      console.error('Chat input element not found');
  }
});