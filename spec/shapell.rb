Dir.glob('./*.list').each do |file|
  File.open(file) do |f|
    f.each_line do |line|
      arr = line.split
      mode = { :user => arr[0][1..3], :group => arr[0][4..6], :ohters => arr[0][7..9] }
      mode.each do |k, v|
        case v
        when 'rwx' then mode[k] = 7
        when 'rw-' then mode[k] = 6
        when 'r-x' then mode[k] = 5
        when 'r--' then mode[k] = 4
        when '-wx' then mode[k] = 3
        when '-w-' then mode[k] = 2
        when '--x' then mode[k] = 1
        when '---' then mode[k] = 0
        end
      end
      puts(mode)
    end
  end
end
