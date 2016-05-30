module Paths_RESTcalc (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/sam/.cabal/bin"
libdir     = "/home/sam/.cabal/lib/x86_64-linux-ghc-7.10.3/RESTcalc-0.0.0-CXpGznk2GYM3aQl2pSSfTH"
datadir    = "/home/sam/.cabal/share/x86_64-linux-ghc-7.10.3/RESTcalc-0.0.0"
libexecdir = "/home/sam/.cabal/libexec"
sysconfdir = "/home/sam/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "RESTcalc_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "RESTcalc_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "RESTcalc_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "RESTcalc_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "RESTcalc_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
