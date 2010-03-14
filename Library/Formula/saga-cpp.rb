require 'formula'

class SagaCpp <Formula
  url 'http://downloads.sourceforge.net/project/saga/SAGA%20C%2B%2B%20Implementation/1.4.1/saga-cpp-1.4.1.src.tar.gz'
  head 'https://svn.cct.lsu.edu/repos/saga/trunk/'
  homepage 'http://saga.cct.lsu.edu'
  md5 'b05c76761f79d64df1af834986e095a8'

  depends_on 'boost'
  depends_on 'postgresql'
  depends_on 'sqlite'
  depends_on 'xmlrpc-c'
  
  aka :saga
  
  def install
    system "./configure", "--prefix=#{prefix}", "--with-boost=#{HOMEBREW_PREFIX}", "--with-postgresql=#{HOMEBREW_PREFIX}", "--with-sqlite3=#{HOMEBREW_PREFIX}"
    system "make install"
  end
  
  def download_strategy
    if ARGV.flag? '--HEAD'
      SubversionDownloadStrategy
    else
      CurlDownloadStrategy
    end
  end
  
end
