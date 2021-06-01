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

const startPlayer = () => {
  let tokenLoc = document.getElementById('player');
  //INITIALIZATION
  if (tokenLoc) {
    let token = tokenLoc.dataset.token;
  
    // Buttons identifications
    const stopLoc = document.getElementById('stop')
    const addTime = document.getElementById('time')
    
    // Define Spotify Player
    window.SpotifyPlayer = new Spotify.Player({
      name: 'Blindtest Player',
      getOAuthToken: callback => {
        // Run code to get a fresh access token
        callback(token);
      },
    });
    
    // Connecting our Spotify Player to Spotify
    window.SpotifyPlayer.connect().then(success => {
      if (success) {
        console.log('The Web Playback SDK successfully connected to Spotify!');
      }
    });
    
    // Collecting the device Id
    window.SpotifyPlayer.addListener('ready', ({ device_id }) => {
      window.deviceId = device_id
    })
  };
}

const startTrack = () => {
  let tokenLoc = document.getElementById('player');
  if (tokenLoc) {
    let token = tokenLoc.dataset.token;
    const startLoc = document.getElementById('start');
    startLoc.addEventListener('click', (event) => {
      let track = tokenLoc.dataset.trackId;
      // Play track
      setTimeout(() => {
        play({
          playerInstance: window.SpotifyPlayer,
          spotify_uri: track,
          device_id: window.deviceId
        })
      }, 1000); // 1s for now but maybe 3-4s depending on (3,2,1) countdown feature
      
      // Initialize timer
      let timer = 15000;
      // Pausing track after timer
      setTimeout(function () {
        window.SpotifyPlayer.pause().then(() => {
          window.SpotifyPlayer.disconnect().then(() => {
          });
        })}, timer)
    });
  }
}

const pauseTrack = () => {
}


const initPlayer = () => {
  window.onSpotifyWebPlaybackSDKReady = () => {
    startPlayer();
    startTrack();

      // In progress : trying to add 15 seconds
      // addTime.addEventListener('click', (event) => {
      //   window.SpotifyPlayer.addListener('player_state_changed', ({
      //     position,
      //     duration,
      //     track_window: { current_track }
      //   }) => {
      //     console.log('Currently Playing', current_track);
      //     console.log('Position in Song', position);
      //     console.log('Duration of Song', duration);
      //   });
      //   timer = timer + 15000;
      //   console.log('time increased');
      //   console.log(timer)
      // });
      // setTimeout(function () {
      //   window.SpotifyPlayer.pause().then(() => {
      //   console.log(timer);
      //   console.log('Paused!');
      //   window.SpotifyPlayer.disconnect().then(() => {
      //     console.log('DECONNECTEEE!');
      //   });
      // })}, timer)
  };
};

export { initPlayer };

// Click : 1) recupérer nombre de secondes
// 2) incrémenter de 15s
// 3) allowed_time = 15s avec passage de temps écoulé + 15s
