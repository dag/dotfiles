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

  widget("sup")

  widget("clock") {
    set :interval => 1
    set :format => "%a %b %d      %T"
  }
}
