package model

import (
	"gorm.io/gorm"
)

// {{.StructName}}Entity {{.Description}}表结构体
type {{.StructName}}Entity struct {
    gorm.Model
{{- range .ModelFields}}
    {{- if isBuiltInField .FieldName}}
        {{- continue}}
    {{- else}}
	{{.FieldName}} {{.FieldType}} `gorm:"column:{{.ColumnName}};type:{{.ColumnType}};{{.NullableDesc}};{{.DefaultValue}};{{.Comment}}"`
	{{- end}}
{{- end}}
}

type {{.StructName}}EntityList []{{.StructName}}Entity

const TableName{{.StructName}} = "{{.TableName}}"

func ({{.StructName}}Entity ) TableName() string {
  return TableName{{.StructName}}
}

func (l {{.StructName}}EntityList) ToMap() map[uint]{{.StructName}}Entity {
	m := make(map[uint]{{.StructName}}Entity)
	for _, v := range l {
		m[v.ID] = v
	}
	return m
}