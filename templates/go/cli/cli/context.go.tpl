package cli

import (
	"github.com/sirupsen/logrus"
	"github.com/spf13/viper"
	"github.com/{{.OrgName}}/{{.RepoName}}/cli/version"
)

type globalCtx struct {
	log         logrus.Entry
	config      viper.Viper
	workingDir  string
	version     version.Properties
}

func (c *globalCtx) ConfigureLogger(setup func(l *logrus.Logger) *logrus.Logger) {
	log := logrus.New()
	c.log = *logrus.NewEntry(setup(log))
}

func (c *globalCtx) EditLogger(edit func(*logrus.Entry) *logrus.Entry) {
	c.log = *edit(&c.log)
}

func (c *globalCtx) Log() *logrus.Entry {
	return &c.log
}

func (c *globalCtx) Config() *viper.Viper {
	return &c.config
}

func (c *globalCtx) WorkingDir() string {
	return c.workingDir
}

func (c *globalCtx) CurrentVersion() *version.Properties {
	return &c.version
}