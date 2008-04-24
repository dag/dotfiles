import "passwords.rb"

blink = {}

color = {
  :normal => "#efefcf",
  :urgent => "#ff0000"
}

awesome {
  set :statusbar => "top"

  widget("cpu_usage") {
    set :property => "data average"
    set :interval => 1
  }

  widget("net_traffic") {
    set :property => "data one"
    set :interval => 1
    set :download_peak => 1200
  }

  widget("alsa") {
    set :property => "data master"
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
      @last == "" ? h("<!>") : @last
    }
  }

  widget("pacman")

  widget("gmail") {
    set :interval => 1.minute
    set :username => "dag.odenhall"
    set :password => GMAIL_PWD

    property("text") {
      blink[@identifier] ||= []
      if @count > 0
        if blink[@identifier].empty?
          blink[@identifier] << IO.popen("bin/blink.rb 0.5 0 top #@identifier fg #{color[:urgent]} #{color[:normal]}")
          blink[@identifier] << IO.popen("bin/blink.rb 0.5 0 top #{@identifier}_icon image .awesome/mail.xbm-red.png .awesome/mail.xbm.png")
        end
      else
        blink[@identifier].each do |blinker|
          Process.kill("SIGINT", blinker.pid)
        end
      end
      @default
    }
  }

  widget("clock") {
    set :interval => 1
    set :format => "%a %b %d      %T"
  }
}
