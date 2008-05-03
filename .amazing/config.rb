awesome {
  set :statusbar => "top"

  widget("clock") {
    set :interval => 1
    set :format => "%T,  %a %b %d"
  }
}

awesome {
  set :statusbar => "bottom"

  widget("alsa") {
    set :property => "data master"
    set :interval => 1.minute
  }

  widget("mpd") {
    set :interval => 1

    property("text") {
      @default if playing?
    }
  }

  widget("moc") {
    set :interval => 5

    property("text") {
      @default if playing?
    }
  }

  widget("pacman")

  widget("sup")

  widget("cpu_usage") {
    set :module => :statgrab_cpu_usage
    set :property => "data average"
    set :interval => 1
  }

  widget("net_traffic") {
    set :property => "data one"
    set :interval => 1
    set :download_peak => 1200
  }
}
