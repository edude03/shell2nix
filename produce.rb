REGEX=/^(?<name>.*)\(\)\s{(?<body>\X*?)}$/
SCRIPT_PATH = ARGV[0]

def gen_drv(names)
  drv = <<-DRV
    {pkgs}: 

    let
      wrapper = scriptPath: name: pkgs.writeShellScriptBin name ''
          source ${scriptPath} && ${name} "$@"
      '';

      #{names.map do |n|
        %{#{n} = wrapper #{SCRIPT_PATH} "#{n}";}
        end.join("\n")
      }
    in
      [#{names.join(" ")}]
    DRV
end

names = File.read(SCRIPT_PATH).scan(REGEX).map do |m|
  name, body = m
  name
end

print gen_drv(names)