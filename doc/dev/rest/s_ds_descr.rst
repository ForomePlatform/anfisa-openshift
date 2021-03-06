Dataset Descriptor structure
============================

.. index:: 
    Dataset descriptor structure; data structure

Format
------

| ``{`` *dictionary*, 
|       "**name**":             dataset name, *string*
|       "**kind**":             dataset kind, *either* ``"ws"`` *or* ``"xl"`` 
|       "**create-time**:       time of dataset installation,
|                                  *string, time time in ISO format*
|       "**upd-time**:          time of last dataset configuration update, 
|                                   ``null`` or *string, time in ISO format*
|       "**note**":             user note to dataset, ``null`` or *string*
|       "**date-note**:         time of last note update, 
|                                   ``null`` or *string, time in ISO format*
|       "**total**":            total number of variants, *int*
|       "**doc**":              dataset documentation, :doc:`s_doc_descr` 
|       "**ancestors**":        information on base datasets
|               ``[`` *list of* base datasets, root is the last
|                   ``[`` *list*
|                       [**0**]: name of ancestor dataset, *string*
|                       [**1**]: *optional* dataset documentation, :doc:`s_doc_descr`
|                   ``]``, ...
|               ``]``
|       
|       *in case of* :doc:`dirinfo` *request*:
|       --------------------------------------
|       "**secondary**":  *optional* list of secondary workspaces, 
|                           *list of strings*
|
|       *in case of* :doc:`dsinfo` *request*:
|       -------------------------------------
|       "**meta**":     metadata of dataset, *JSON structure*
|       "**classes**":  descriptor of :term:`filtering properties classification`
|               ``[`` *list* of facet classifications
|                   ``{``
|                       **title**: title of facet classification, *string*
|                       **values**: titles of values, *list of strings*
|                   ``}``, ...
|               ``]``
|       "**unit-groups**": group names of filtering properties,
|           ``[`` *list of strings* ``]``
|       "**cohorts**": *optional* list of cohort names 
|           ``[`` *list of strings* ``]``
|       "**export-max-count**:  maximum record count available for 
|                       export operations (:doc:`csv_export`, :doc:`export`), *int*

Description
-----------

The descriptor represents information about :term:`dataset`. It is used in context of two requests: 

* :doc:`dirinfo` 
    returns collection of  descriptors of all active datasets in the :term:`vault`. In this context details of connection between datasets are required: dataset can be :term:`secondary<secondary workspace>`, so one needs to know base of it. :term:`Root dataset` is defined always, and for a :term:`primary dataset` equals to itself.

* :doc:`dsinfo` 
    returns descriptor for one dataset.
    In this case descriptor contains details about metadata.

Descriptor provides reference **doc** to :term:`dataset documentation`, and if base dataset exists, reference to documentation for all **ancestors** if they are present in the vault.
    
Comment
-------
Important part of metadata is list of versions of sources used in dataset annotation. It is located in **meta** returning property:

|         ``["versions"]: {`` *dictionary*
|                   source name, *string*: source version, *string* 
|                   ...
|               ``}``
    
Used in requests
----------------
:doc:`dirinfo`   

:doc:`dsinfo`

:doc:`s_doc_descr`

:doc:`../concepts/doc_pg`

:doc:`../concepts/restrict_flt`
