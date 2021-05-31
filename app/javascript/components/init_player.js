const play = ({
  spotify_uri,
  device_id,
  playerInstance: {
    _options: {
      getOAuthToken
    }
  }
}) => {
  getOAuthToken(access_token => {
    fetch(`https://api.spotify.com/v1/me/player/play?device_id=${device_id}`, {
      method: 'PUT',
      body: JSON.stringify({ uris: [spotify_uri] }),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${access_token}`
      },
    });
  });
};


const initPlayer = () => {
  window.onSpotifyWebPlaybackSDKReady = () => {
    // You can now initialize Spotify.Player and use the SDK
    // Retrieve token
    const tokenLoc = document.getElementById('player');
    if (tokenLoc) {
      let token = tokenLoc.dataset.token;
      // console.log(token);
      // Retrieve track uri
      // console.log(track)
      // Buttons identifications
      const startLoc = document.getElementById('start')
      const stopLoc = document.getElementById('stop')
      const addTime = document.getElementById('time')
      let timer = 15000

      // Define Spotify Player
      let player = new Spotify.Player({
        name: 'Blindtest Player',
        getOAuthToken: callback => {
          // Run code to get a fresh access token
          callback(token);
        },
      });

      // Error handling
      player.addListener('initialization_error', ({ message }) => { console.error(message); });
      player.addListener('authentication_error', ({ message }) => { console.error(message); });
      player.addListener('account_error', ({ message }) => { console.error(message); });
      player.addListener('playback_error', ({ message }) => { console.error(message); });

      // Playback status updates
      player.addListener('player_state_changed', state => { console.log(state); });

      if (startLoc) {
        startLoc.addEventListener('click', (event) => {
          console.log("ok");
          player.connect().then(success => {
            if (success) {
              console.log('The Web Playback SDK successfully connected to Spotify!');
            }
          });
          player.addListener('ready', ({ device_id }) => {
            console.log('The Web Playback SDK is ready to play music!');
            console.log('Device ID', device_id);
            let track = tokenLoc.dataset.trackId;
            console.log(track)

            play({
              playerInstance: player,
              spotify_uri: track,
              device_id: device_id
            })



            // In progress : trying to add 15 seconds
            addTime.addEventListener('click', (event) => {
              player.addListener('player_state_changed', ({
                position,
                duration,
                track_window: { current_track }
              }) => {
                console.log('Currently Playing', current_track);
                console.log('Position in Song', position);
                console.log('Duration of Song', duration);
              });
              timer = timer + 15000;
              console.log('time increased');
              console.log(timer)
            })
          });
          setTimeout(function(){player.pause().then(() => {
            console.log(timer);
            console.log('Paused!');
            player.disconnect().then(() => {
              console.log('DECONNECTEEE!');
              Turbolinks.clearCache()
            });
          })}, timer)
        })
      }
    }


  };
}

export { initPlayer };

// Click : 1) recupérer nombre de secondes
// 2) incrémenter de 15s
// 3) allowed_time = 15s avec passage de temps écoulé + 15s
