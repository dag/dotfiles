import "passwords.rb"

BLINK = {}

color = {
  :normal => "#dddddd",
  :urgent => "#ff0000"
}

awesome {
  set :statusbar => "top"

  widget("cpu_usage") {
    set :property => "data one"
    set :interval => 1
    set :cpu => 1
  }

  widget("cpu_usage1") {
    set :module => :cpu_usage
    set :property => "data one"
    set :interval => 1
    set :cpu => 2
  }

  widget("net_traffic") {
    set :property => "data one"
    set :interval => 1
    set :download_peak => 1200
  }

  widget("alsa") {
    set :property => "data one"
    set :interval => 1.minute
  }

  widget("mpd") {
    set :interval => 1

    property("text") {
      if @state == :playing
        @default
      else
        " "
      end
    }
  }

  widget("moc") {
    set :interval => 5

    property("text") {
      if @state == :playing
        @default
      else
        " "
      end
    }
  }

  widget("personal_status") {
    set :module => :file
    set :file => ".personal_status"

    property("text") {
      @last == "" ? "<!>" : @last
    }
  }

  widget("pacman") {
    property("text") {
      BLINK[@identifier] = @count > 0
      @default
    }
  }

  widget("pacman") {
    set :module => :noop
    set :interval => 1

    property("fg") {
      if BLINK[@identifier] && @iteration % 2 == 0
        color[:urgent]
      else
        color[:normal]
      end
    }
  }

  widget("pacman_icon") {
    set :module => :noop
    set :interval => 1

    property("image") {
      if BLINK["pacman"] && @iteration % 2 == 0
        ".awesome/pacman.xbm-red.png"
      else
        ".awesome/pacman.xbm.png"
      end
    }
  }

  widget("gmail") {
    set :interval => 5.minutes
    set :username => "dag.odenhall"
    set :password => GMAIL_PWD

    property("text") {
      BLINK[@identifier] = @count > 0
      @default
    }
  }

  widget("gmail") {
    set :module => :noop
    set :interval => 1

    property("fg") {
      if BLINK[@identifier] && @iteration % 2 == 0
        color[:urgent]
      else
        color[:normal]
      end
    }
  }

  widget("gmail_icon") {
    set :module => :noop
    set :interval => 1

    property("image") {
      if BLINK["gmail"] && @iteration % 2 == 0
        ".awesome/mail.xbm-red.png"
      else
        ".awesome/mail.xbm.png"
      end
    }
  }

  widget("clock") {
    set :interval => 1
    set :format => "%a %b %d      %T"
  }
}
