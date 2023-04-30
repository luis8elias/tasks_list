import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '/presentation/shared/buttons.dart';
import '/config/size_constants.dart';
import '/domain/entities/task_detailed_entity.dart';
import '/presentation/shared/custom_checkbox.dart';
import '/presentation/shared/inputs.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({
    super.key,
    this.task,
    required this.onSave,
    required this.buttonFactory
  });

  final TaskDetailedEntity? task;
  final Widget Function(Widget button) buttonFactory;
  final void Function(
    String title,
    bool isCompleted,
    String dueDate,
    String comments,
    String description,
    String tags,
  ) onSave;

  

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {

  final formKey = GlobalKey<FormState>();

  late TextEditingController titleController;
  late bool isCompleted;
  late TextEditingController dueDateController;
  late TextEditingController commentsController;
  late TextEditingController descriptionController;
  late TextEditingController tagsController;


  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.task != null ?  widget.task!.title : ''
    );
    isCompleted = widget.task != null ?  widget.task!.isCompletedAsBool : false;
    dueDateController = TextEditingController(
      text: widget.task != null ?  widget.task!.dueDate : ''
    );
    commentsController = TextEditingController(
      text: widget.task != null ?  widget.task!.comments : ''
    );
    descriptionController = TextEditingController(
      text: widget.task != null ?  widget.task!.description : ''
    );
    tagsController = TextEditingController(
      text: widget.task != null ?  widget.task!.tags : ''
    );
    
  }

  @override
  void dispose() {
    titleController.dispose();
    dueDateController.dispose();
    commentsController.dispose();
    descriptionController.dispose();
    tagsController.dispose();
    super.dispose();
  }

  Future<void> _showDatePicker({required BuildContext context , String? initalValue}) async{
    final atualYear = DateTime.now().year;
    final result = await showDatePicker(
      context: context,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: initalValue != null ? DateTime.parse(initalValue) : DateTime.now(),
      firstDate: DateTime(atualYear-40),
      lastDate: DateTime(atualYear+20)
    );
    final formatter = DateFormat('yyyy-MM-dd');
    if(result != null){
      dueDateController.text = formatter.format(result);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kPadding * 2),
              GenericInput(
                label: 'Titulo *',
                hintText: 'Escriba el titulo',
                controller: titleController,
                isRequired: true,
              ),
              const SizedBox(
                height: kPadding,
              ),
              Row(
                children: [
                  CustomCheckBox(
                    isCheked: isCompleted,
                    onChanged: (value) {
                      isCompleted = value;
                    },
                  ),
                  const SizedBox(
                    width: kPadding,
                  ),
                  Text(
                    'Marcar tarea como completada',
                    style:Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
              const SizedBox(
                height: kPadding * 2,
              ),
              Row(
                children:  [
                  Expanded(
                    flex: 5,
                    child: GenericInput(
                      onTap: () {
                        _showDatePicker(
                          context: context,
                          initalValue: widget.task != null ?  widget.task!.dueDate : null
                        );
                      },
                      label: 'Fecha de vencimiento',
                      hintText: 'Seleccione la fecha',
                      controller: dueDateController,
                      readOnly: true,
                    ),
                  ),
                   Expanded(
                    child: IconButton(
                      splashRadius: 25,
                      onPressed: () {
                        _showDatePicker(
                          context: context,
                          initalValue: widget.task != null ?  widget.task!.dueDate : null
                        );
                      },
                      icon: const Icon(Icons.calendar_month)
                    )
                  )
                ],
              ),
              const SizedBox(
                height: kPadding * 3,
              ),
              GenericInput(
                label: 'Comentarios',
                hintText: 'Agregue comentarios',
                controller: commentsController,
              ),
              const SizedBox(
                height: kPadding * 3,
              ),
              GenericInput(
                label: 'Descricpión',
                hintText: 'Agregue una descripción',
                controller: descriptionController,
              ),
              const SizedBox(
                height: kPadding * 3,
              ),
              GenericInput(
                label: 'Tags',
                hintText: 'Agregue tags',
                controller: tagsController,
              ),
              const SizedBox(
                height: kPadding * 3,
              ),
              Center(
                child: widget.buttonFactory(
                  ButtonWithIcon(
                    icon: Icons.save,
                    text: 'Guardar',
                    onPressed: (){
                      if (formKey.currentState!.validate()) {
                        widget.onSave(
                          titleController.text,
                          isCompleted,
                          dueDateController.text,
                          commentsController.text,
                          descriptionController.text,
                          tagsController.text
                        );
                      }
                    }
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}