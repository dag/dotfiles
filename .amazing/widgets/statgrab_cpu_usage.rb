class StatgrabCpuUsage < Widget
  description "Cpu usage with statgrab"
  dependency "statgrab", "http://github.com/dag/ruby-statgrab"
  field :user, "Usage in percents by user state"
  field :kernel, "Usage in percents by kernel state"
  field :idle, "Usage in percents by idle state"
  field :iowait, "Usage in percents by iowait state"
  field :swap, "Usage in percents by swap state"
  field :nice, "Usage in percents by nice state"
  default { @user.to_i }

  init do
    @@sg ||= Statgrab.new
    percents = @@sg.cpu_percents
    @user = percents[:user]
    @kernel = percents[:kernel]
    @idle = percents[:idle]
    @iowait = percents[:iowait]
    @swap = percents[:swap]
    @nice = percents[:nice]
  end
end
