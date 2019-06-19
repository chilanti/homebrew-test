class Testmcformula < Formula
    desc "KnappPaks command-line interface"
    homepage "https://github.ibm.com/knapppaks/knapp-cli#readme"
    version "0.0.0"
    url "file:///tmp/knapp-homebrew-0.0.0.tar.gz" 
    #url "https://github.ibm.com/chilantim/homebrew-knapp/blob/master/test.tar.gz"
    sha256 "9b01aed0b2d1b296ad84ffe2b401a265a8d9b45cc22ebcb0760e04abbd5a9129"
  #  url "https://github.ibm.com/KnAppPaks/knapp-cli/archive/master.zip",
  #      :tag      => "master"
  #      :revision => "b5d4f876f4bfe294b70c092210613e30eceb0dc4"
  #  head "git@github.ibm.com:KnAppPaks/knapp-cli.git"
  
  #  bottle do
  
    def install
      bin.install "knapp"
      bin.install "knapp-controller" 
      ohai "Checking prerequisites..."
      #system "docker"
      retval=check_prereqs

        if retval
          ohai "Done."
       else
          opoo "Docker not installed or not running."
        end
    end
    def check_prereqs
      begin
        original_stderr = $stderr.clone
        original_stdout = $stdout.clone
        $stderr.reopen(File.new('/dev/null', 'w'))
        $stdout.reopen(File.new('/dev/null', 'w'))
        begin
          system('/usr/local/bin/docker', 'ps')
          retval=true
        rescue
          retval=false
        end
      rescue Exception => e
        $stdout.reopen(original_stdout)
        $stderr.reopen(original_stderr)
        raise e
      ensure
        $stdout.reopen(original_stdout)
        $stderr.reopen(original_stderr)
      end
      return retval
    end
    test do
      raise "Test not implemented."
    end
  end
  
