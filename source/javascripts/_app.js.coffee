$ = jQuery

do ($, window) ->
  $ ->

    ###
    # JPLAYER
    ###

    player = $('#jplayer').jPlayer
      swfPath             : "/javascripts"
      supplied            : 'mp3, m4a, ogg'
      solution            : 'html, flash'
      errorAlerts         : false
      volume              : 0.5
      cssSelectorAncestor : '#jplayer-container'

    ###
    # FILE INPUT
    ###

    $('#file_input').change () ->
      file = file_input.files[0]
      objectURL = window.URL.createObjectURL(file)
      console.log file
      $('.picker-call').html(file.name)
      $('#jplayer').jPlayer("setMedia", {
        mp3 : objectURL
        ogg : objectURL
        webm: objectURL
        m4a : objectURL
      }).jPlayer('play')
      $('.c-play-pause i').addClass('icon-pause').removeClass('icon-play')

    ###
    # CONTROL FUNCTIONS
    ###

    # SHORTCUTS MODAL
    show_shortcuts = () ->
      $('.shortcuts').toggleClass('shortcuts-displayed')

    # PLAY/PAUSE
    player_play_pause = () ->
      if player.data().jPlayer.status.paused is false
        player.jPlayer('pause')
        $('.c-play-pause i').addClass('icon-play').removeClass('icon-pause')
      else if player.data().jPlayer.status.paused is true
        player.jPlayer('play')
        $('.c-play-pause i').addClass('icon-pause').removeClass('icon-play')

    # MOVE PLAYHEAD BACK 5 SECONDS
    head_back = () ->
      if player.data().jPlayer.status.paused is false
        player.jPlayer 'play', player.data().jPlayer.status.currentTime - 5
      else if player.data().jPlayer.status.paused is true
        player.jPlayer 'pause', player.data().jPlayer.status.currentTime - 5

    # MOVE PLAYHERD FORWARD 5 SECONDS
    head_forward = () ->
      if player.data().jPlayer.status.paused is false
        player.jPlayer 'play', player.data().jPlayer.status.currentTime + 5
      else if player.data().jPlayer.status.paused is true
        player.jPlayer 'pause', player.data().jPlayer.status.currentTime + 5

    # PLAYBACK SPEED SLOWER
    speed_slower = () ->
      audio = document.getElementById 'jp_audio_0'
      audio.playbackRate -= 0.1
      $('.playback-speed').html Math.round(audio.playbackRate*10)/10

    # PLAYBACK SPEED FASTER
    speed_faster = () ->
      audio = document.getElementById 'jp_audio_0'
      audio.playbackRate += 0.1
      $('.playback-speed').html Math.round(audio.playbackRate*10)/10

    # DROP TIMESTAMP
    drop_timestamp = () ->
      current_time = player.data().jPlayer.status.currentTime
      formatted_time = moment().sod().add('seconds', current_time).format('H:mm:ss')
      $('.transcription').val($('.transcription').val() + formatted_time)

    ###
    # KEYBOARD SHORTCUTS
    # Thanks to: http://craig.is/killing/mice
    ###

    # SHORTCUTS MODAL
    Mousetrap.bind 'ctrl+/', () ->
      show_shortcuts()
      return false

    # PLAY/PAUSE
    Mousetrap.bind 'ctrl+space', () ->
      player_play_pause()
      return false

    # MOVE PLAYHEAD BACK 5 SECONDS
    Mousetrap.bind 'ctrl+h', (e) ->
      head_back()
      return false

    # MOVE PLAYHEAD FORWARD 5 SECONDS
    Mousetrap.bind 'ctrl+l', (e) ->
      head_forward()
      return false

    # PLAYBACK SPEED SLOWER
    Mousetrap.bind 'ctrl+k', (e) ->
      speed_slower()
      return false

    # PLAYBACK SPEED FASTER
    Mousetrap.bind 'ctrl+j', (e) ->
      speed_faster()
      return false

    # DROP TIMESTAMP
    Mousetrap.bind 'ctrl+s', (e) ->
      drop_timestamp()
      return false

    ###
    # MANUAL CONTROLS
    ###

    # SHOW SHORTCUTS
    $('.c-shortcuts').on 'click', (e) ->
      show_shortcuts()
      return false

    $('.shortcuts-close').on 'click', (e) ->
      show_shortcuts()

    $(document).on 'click', (e) ->
      if $('.shortcuts').is('.shortcuts-displayed') is true
        show_shortcuts()

    $('.shortcuts').on 'click', () ->
      return false

    # PLAY/PAUSE
    $('.c-play-pause').on 'click', (e) ->
      player_play_pause()

    # MOVE PLAYHEAD BACK 5 SECONDS
    $('.c-step-back').on 'click', (e) ->
      head_back()

    # MOVE PLAYHEAD FORWARD 5 SECONDS
    $('.c-step-forward').on 'click', (e) ->
      head_forward()

    # PLAYBACK SPEED SLOWER
    $('.c-speed-down').on 'click', (e) ->
      speed_slower()

    # PLAYBACK SPEED FASTER
    $('.c-speed-up').on 'click', (e) ->
      speed_faster()

    # DROP TIMESTAMP
    $('.c-drop-timestamp').on 'click', (e) ->
      drop_timestamp()

    ###
    # ET CETERA
    ###

    $('.feature').on 'click', (e) ->
      t = '.feature-' + $(this).text()
      $(t).toggle(500)

    ###
    # LOCALSTORAGE SYNC
    ###

    update = setInterval (-> 
        set_storage()
      ), 5000

    set_storage = () ->
      transcription = $('.transcription').val()
      current_time = player.data().jPlayer.status.currentTime
      formatted_time = moment().sod().add('seconds', current_time).format('H:mm:ss')
      console.log 'Sync-ed.'
      sessionStorage.setItem('transcription', transcription)
      sessionStorage.setItem('time', formatted_time)

    if sessionStorage.getItem('transcription') isnt ''
      $('.transcription').val(sessionStorage.getItem('transcription') + '\n\n' + sessionStorage.getItem('time'))